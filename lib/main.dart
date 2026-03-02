import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:qris_health/constants/pref_constants.dart';
import 'package:qris_health/modules/all_scans_module/cubits/tests_category_cubit.dart';
import 'package:qris_health/modules/health_article_module/cubits/health_article_category_cubit/health_article_category_cubit.dart';
import 'package:qris_health/modules/health_article_module/cubits/health_articles_cubit/health_article_cubit.dart';
import 'package:qris_health/modules/health_module/cubits/qris_doctors_cubit/qris_doctors_cubit.dart';
import 'package:qris_health/modules/home_module/popular_packages_cubit/popular_packages_cubit.dart';
import 'package:qris_health/modules/intro_module/screens/custom_splash_screen.dart';
import 'package:qris_health/modules/orders_modele/cart_cubit/cart_cubit.dart';
import 'package:qris_health/modules/patients_module/cubits/patients_cubit/patients_cubit.dart';
import 'package:qris_health/modules/refer_and_earn_module/cubits/qris_coin_cubit/qris_coins_cubit.dart';
import 'package:qris_health/modules/users_module/cubits/user_cubit.dart';
import 'package:qris_health/shared/cubits/qris_config_cubit/qris_config_cubit.dart';
import 'package:qris_health/shared/models/notification_launch_data.dart';
import 'package:qris_health/shared/services/facebook_analytics_service.dart';
import 'package:qris_health/shared/services/token_manager.dart';
import 'package:qris_health/shared/utils/navigator_utils.dart';
import 'package:qris_health/shared/utils/permission_coordinator.dart';
import 'package:qris_health/styles/app_styles.dart';
import 'firebase_options.dart';
import 'modules/refer_and_earn_module/cubits/qris_wallet_cubit/qris_wallet_cubit.dart';

final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

@pragma('vm:entry-point')
Future<void> _myBackgroundMessageHandler(RemoteMessage message) async {
  await _showNotification(message);
}

@pragma('vm:entry-point')
void _onNotificationTap(NotificationResponse response) async {
  final payload = response.payload;

  if (payload != null) {
    try {
      final data = json.decode(payload);
      if (data is Map && data.containsKey(PrefConstants.url)) {
        final url = data[PrefConstants.url];
        NavigatorUtils.handleUrl(
            url: url, navigatorKey: NotificationLaunchData.navigatorKey);
      }
    } catch (e) {
      debugPrint("Failed to handle notification tap: $e");
    }
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FacebookAnalyticsService.initialize();

  try {
    await TokenManager.ensureValidToken();
  } catch (e) {
    debugPrint('Token validation error: $e');
  }

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _initializeNotifications();
    _firebaseCloudMessagingListeners();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HealthArticleCubit()),
          BlocProvider(create: (context) => HealthArticleCategoryCubit()),
          BlocProvider(create: (context) => TestsCategoryCubit()),
          BlocProvider(create: (context) => UserCubit()),
          BlocProvider(create: (context) => PopularPackagesCubit()),
          BlocProvider(create: (context) => PatientsCubit()),
          BlocProvider(create: (context) => QrisDoctorsCubit()),
          BlocProvider(create: (context) => QrisConfigCubit()),
          BlocProvider(create: (context) => CartCubit()),
          BlocProvider(create: (context) => QrisWalletCubit()),
          BlocProvider(create: (context) => QrisCoinsCubit()),
        ],
        child: MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(1.022)),
          child: GetMaterialApp(
              navigatorKey: NotificationLaunchData.navigatorKey,
              debugShowCheckedModeBanner: false,
              title: 'Qris Health',
              theme: AppStyles.theme(context),
              home: CustomSplashScreen()),
        ));
  }

  Future<void> _initializeNotifications() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings();

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
    );
  }

  Future<void> _firebaseCloudMessagingListeners() async {
    if (Platform.isIOS) {
      await FirebaseMessaging.instance.requestPermission(
          sound: true, badge: true, alert: true, provisional: false);
      
      await Future.delayed(const Duration(milliseconds: 500));
      PermissionCoordinator.markNotificationPermissionComplete();

      /// add ability to add notifications in foreground
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      /// When user taps on the notification
      FirebaseMessaging.onMessageOpenedApp.listen((message) async {
        final url = message.data.containsKey(PrefConstants.url)
            ? message.data[PrefConstants.url]
            : null;

        await NavigatorUtils.handleUrl(
            url: url, navigatorKey: NotificationLaunchData.navigatorKey);
      });
    }

    if (Platform.isAndroid) {
      /// Set background handler
      FirebaseMessaging.onBackgroundMessage(_myBackgroundMessageHandler);

      /// When notification is received when app is in foreground
      FirebaseMessaging.onMessage.listen((event) async {
        try {
          await _showNotification(event);
        } catch (e) {
          debugPrint(e.toString());
        }
      });

      /// When user clicks on notification when application is terminated
      final details = await _flutterLocalNotificationsPlugin
          .getNotificationAppLaunchDetails();

      if (details?.didNotificationLaunchApp == true) {
        final payload = details!.notificationResponse!.payload;

        try {
          if (payload != null) {
            final decodedPayload = json.decode(payload);

            if (decodedPayload is Map &&
                decodedPayload.containsKey(PrefConstants.url)) {
              final url = decodedPayload[PrefConstants.url];
              if (url != null) {
                NotificationLaunchData.tappedUrl = url;
              }
            }
          }
        } catch (e) {}
      }
    }

    /// On notification click in terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      final url =
          message?.data != null && message!.data.containsKey(PrefConstants.url)
              ? message.data[PrefConstants.url]
              : null;

      if (url != null) {
        NotificationLaunchData.tappedUrl = url;
      }
    });
  }
}

Future<void> _showNotification(RemoteMessage message) async {
  try {
    final title =
        GetPlatform.isIOS ? message.notification?.title : message.data['title'];
    final body =
        GetPlatform.isIOS ? message.notification?.body : message.data['body'];

    AndroidNotificationDetails androidNotificationDetailsWithDefaultSound =
        const AndroidNotificationDetails('1', 'channel name',
            channelDescription: 'channel description',
            icon: '@mipmap/ic_launcher',
            playSound: true,
            priority: Priority.high,
            importance: Importance.high);

    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidNotificationDetailsWithDefaultSound,
        iOS: DarwinNotificationDetails(presentSound: true));

    _flutterLocalNotificationsPlugin.show(
        DateTime.now().millisecondsSinceEpoch.remainder(100000),
        title,
        body,
        platformChannelSpecifics,
        payload: json.encode(message.data));
  } catch (e) {
    debugPrint(e.toString());
  }
}
