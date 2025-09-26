import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../modules/address_module/screens/address_screen.dart';
import '../../modules/health_article_module/screens/health_article_detail_screen.dart';
import '../../modules/health_article_module/screens/health_articles_screen.dart';
import '../../modules/health_article_module/services/health_article_service.dart';
import '../../modules/health_module/screens/mental_wellness_screen.dart';
import '../../modules/home_module/screens/popular_package_screen.dart';
import '../../modules/orders_modele/screens/orders_screen.dart';
import '../../modules/patients_module/screens/patients_screen.dart';
import '../../modules/profile_module/screens/my_profile_screen.dart';
import '../../modules/refer_and_earn_module/screens/coins_screen.dart';
import '../../modules/refer_and_earn_module/screens/wallet_screen.dart';
import '../../modules/screens/blood_test_detail_screen.dart';

class NavigatorUtils {
  static Future<void> handleUrl(
      {required String? url,
      required GlobalKey<NavigatorState> navigatorKey}) async {
    final uri = Uri.tryParse('$url');

    if (uri == null) {
      return;
    }

    if (await canLaunchUrl(uri)) {
      await launch(url!);
    } else {
      final segments = uri.pathSegments;
      if (segments.isEmpty) return;

      final context = navigatorKey.currentContext;
      if (context == null) return;

      if (segments.first == 'test' && segments.length == 2) {
        final testId = int.tryParse(segments[1]);

        if (testId != null) {
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => BloodTestDetailScreen(testId: testId)));
        }
      }

      if (segments.first == 'article' && segments.length == 2) {
        final articleId = int.tryParse(segments[1]);

        if (articleId != null) {
          final articles = await HealthArticleService.getArticlesByArticleIds(
              testIds: [articleId]);

          if (articles.isNotEmpty) {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) =>
                    HealthArticleDetailScreen(healthArticle: articles.first)));
          }
        }
      }

      if (segments.first == 'popular') {
        final length = segments.length;

        if (length == 1) {
          Navigator.of(context).push(
              CupertinoPageRoute(builder: (context) => PopularPackageScreen()));
        } else if (length == 3) {
          final secondPath = segments[1];
          final id = int.tryParse(segments[2]);

          Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => PopularPackageScreen(
                  riskAreaId: secondPath == 'risk' ? id : null,
                  categoryId: secondPath == 'category' ? id : null)));
        }
      }

      if (segments.first == 'profile') {
        Navigator.of(context)
            .push(CupertinoPageRoute(builder: (context) => MyProfileScreen()));
      }

      if (segments.first == 'address') {
        Navigator.of(context)
            .push(CupertinoPageRoute(builder: (context) => AddressScreen()));
      }

      if (segments.first == 'member') {
        Navigator.of(context)
            .push(CupertinoPageRoute(builder: (context) => PatientsScreen()));
      }

      if (segments.first == 'wallet') {
        Navigator.of(context)
            .push(CupertinoPageRoute(builder: (context) => WalletScreen()));
      }

      if (segments.first == 'coins') {
        Navigator.of(context)
            .push(CupertinoPageRoute(builder: (context) => CoinsScreen()));
      }

      if (segments.first == 'order') {
        Navigator.of(context)
            .push(CupertinoPageRoute(builder: (context) => OrdersScreen()));
      }

      if (segments.first == 'wellness') {
        Navigator.of(context).push(
            CupertinoPageRoute(builder: (context) => MentalWellnessScreen()));
      }

      if (segments.first == 'articles') {
        Navigator.of(context).push(
            CupertinoPageRoute(builder: (context) => HealthArticlesScreen()));
      }
    }
  }
}
