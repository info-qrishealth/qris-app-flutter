import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';
import 'package:qris_health/shared/models/app_banner/app_banner.dart';
import 'package:qris_health/shared/utils/navigator_utils.dart';

import '../../../constants/app_constants.dart';
import '../../../shared/models/notification_launch_data.dart';
import '../../../shared/services/file_service.dart';
import '../../../styles/app_colors.dart';

class HomeScreenCarousel extends StatefulWidget {
  const HomeScreenCarousel({super.key});

  @override
  State<HomeScreenCarousel> createState() => _HomeScreenCarouselState();
}

class _HomeScreenCarouselState extends State<HomeScreenCarousel> {
  late Future<List<AppBanner>> _bannerFuture;
  int? _currentIndex;

  @override
  void initState() {
    super.initState();
    _bannerFuture = FileService.getAllAppBanners();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _bannerFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final banners = snapshot.data!;

            if (banners.isEmpty) {
              return Container();
            }

            _currentIndex ??= banners.length ~/ 2;

            return Column(
              children: [
                FlutterCarousel.builder(
                    itemCount: banners.length,
                    itemBuilder: (context, index, i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: _buildCarouselCard(banner: banners[index]),
                      );
                    },
                    options: FlutterCarouselOptions(
                        aspectRatio: 2.35,
                        initialPage: banners.length ~/ 2,
                        enlargeCenterPage: true,
                        showIndicator: false,
                        enlargeFactor: 0.1,
                        viewportFraction: 0.92,
                        onPageChanged: (index, _) {
                          _currentIndex = index;
                          setState(() {});
                        })),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    banners.length,
                    (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: 6,
                      height: 6,
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? AppColors.primaryPink
                            : AppColors.primaryPink.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          return FadeShimmer(
              width: double.infinity,
              height: 150,
              fadeTheme: FadeTheme.light,
              radius: 16);
        });
  }

  Widget _buildCarouselCard({required AppBanner banner}) {
    final textTheme = Get.textTheme;

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await NavigatorUtils.handleUrl(
            url: banner.onTap,
            navigatorKey: NotificationLaunchData.navigatorKey);
      },
      child: Container(
        padding: EdgeInsets.all(13).copyWith(bottom: 0),
        decoration: BoxDecoration(
            color: banner.backgroundColor2Value == Colors.transparent
                ? banner.backgroundColor1Value
                : null,
            gradient: banner.backgroundColor2Value != Colors.transparent
                ? LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                        banner.backgroundColor1Value,
                        banner.backgroundColor2Value!
                      ])
                : null,
            borderRadius: BorderRadius.circular(16)),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  banner.title,
                  style: textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: AppConstants.ubuntuFontFamily),
                ),
                Text(
                  banner.description,
                  style: textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w400, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: SizedBox(
                    height: 24,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              banner.buttonBackgroundColorValue ?? Colors.white,
                        ),
                        onPressed: () async {
                          await NavigatorUtils.handleUrl(
                              url: banner.onTap,
                              navigatorKey:
                                  NotificationLaunchData.navigatorKey);
                        },
                        child: Text(banner.buttonText,
                            style: textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w700,
                                color: banner.buttonTextColorValue ??
                                    AppColors.primaryPink))),
                  ),
                ),
                SizedBox(height: 13),
              ],
            ),
          ),
          SizedBox(width: 6),
          SizedBox(
            width: 142,
            height: 145,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Image.network(banner.image, fit: BoxFit.fill)),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
