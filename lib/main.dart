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
import 'package:qris_health/shared/utils/navigator_utils.dart';
import 'package:qris_health/styles/app_styles.dart';

import 'firebase_options.dart';
import 'modules/refer_and_earn_module/cubits/qris_wallet_cubit/qris_wallet_cubit.dart';

final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

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
        NavigatorUtils.handleUrl(url: url, navigatorKey: _navigatorKey);
      }
    } catch (e) {
      print("Failed to handle notification tap: $e");
    }
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        child: GetMaterialApp(
            navigatorKey: _navigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'Qris Health',
            theme: AppStyles.theme(context),
            home: CustomSplashScreen()));
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
    try {
      if (Platform.isIOS) {
        FirebaseMessaging.instance.requestPermission(
            sound: true, badge: true, alert: true, provisional: false);

        await FirebaseMessaging.instance
            .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
      }

      if (Platform.isAndroid) {
        FirebaseMessaging.onBackgroundMessage(_myBackgroundMessageHandler);
      }
    } catch (e) {
      print(e.toString());
    }

    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      final url =
          message?.data != null && message!.data.containsKey(PrefConstants.url)
              ? message.data[PrefConstants.url]
              : null;

      await NavigatorUtils.handleUrl(url: url, navigatorKey: _navigatorKey);
    });

    FirebaseMessaging.onMessage.listen((event) async {
      try {
        await _showNotification(event);
      } catch (e) {
        print(e.toString());
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
    print(e);
  }
}
