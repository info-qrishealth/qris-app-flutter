import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import 'app_colors.dart';

class AppStyles {
  static ThemeData theme(BuildContext context) {
    return ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
        useMaterial3: false,
        cupertinoOverrideTheme: CupertinoThemeData(
            primaryColor: AppColors.primaryPink,
            scaffoldBackgroundColor: Colors.white,
            textTheme:
                CupertinoTextThemeData(primaryColor: AppColors.primaryPink)),
        primaryColor: AppColors.primaryPink,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        scaffoldBackgroundColor: Colors.white,
        cardColor: Colors.white,
        checkboxTheme: checkboxTheme(),
        bottomSheetTheme: bottomSheetTheme(),
        inputDecorationTheme: inputDecoration(context),
        appBarTheme: appBarTheme(context),
        textButtonTheme: textButtonTheme(context),
        elevatedButtonTheme: elevatedButtonTheme(context),
        outlinedButtonTheme: outlinedButtonTheme(context),
        fontFamily: AppConstants.latoFontFamily,
        textTheme: const TextTheme(
            labelSmall: TextStyle(
                fontFamily: AppConstants.latoFontFamily,
                letterSpacing: 0,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.black),
            labelMedium: TextStyle(
                fontFamily: AppConstants.latoFontFamily,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.black),
            bodySmall: TextStyle(
                fontFamily: AppConstants.latoFontFamily,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.black),
            bodyMedium: TextStyle(
                fontFamily: AppConstants.latoFontFamily,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.black),
            labelLarge: TextStyle(
                fontFamily: AppConstants.latoFontFamily,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.black),
            bodyLarge: TextStyle(
                fontFamily: AppConstants.latoFontFamily,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.black),
            titleSmall: TextStyle(
                fontFamily: AppConstants.ubuntuFontFamily,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.black),
            titleMedium: TextStyle(
                fontFamily: AppConstants.ubuntuFontFamily,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.black),
            titleLarge: TextStyle(
                fontFamily: AppConstants.ubuntuFontFamily,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.black),
            headlineSmall: TextStyle(
                fontFamily: AppConstants.ubuntuFontFamily,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.black),
            headlineMedium: TextStyle(
                fontFamily: AppConstants.ubuntuFontFamily,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.black),
            headlineLarge: TextStyle(
                fontFamily: AppConstants.ubuntuFontFamily,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.black)),
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: AppColors.primaryPink, secondary: AppColors.primaryPink));
  }

  static double cardBorderRadius = 15.0;

  static ElevatedButtonThemeData elevatedButtonTheme(BuildContext context) =>
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromHeight(54),
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: AppConstants.ubuntuFontFamily),
              disabledBackgroundColor: Colors.black.withOpacity(0.29),
              disabledForegroundColor: Colors.white,
              elevation: 0,
              backgroundColor: AppColors.primaryPink,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100))));

  static OutlinedButtonThemeData outlinedButtonTheme(BuildContext context) {
    return OutlinedButtonThemeData(
        style: buttonStyle(context).copyWith(
            fixedSize: WidgetStateProperty.all(const Size.fromHeight(54)),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
            side: WidgetStateProperty.all(
                const BorderSide(color: AppColors.primaryPink))));
  }

  static ButtonStyle buttonStyle(BuildContext context) {
    return ButtonStyle(
        fixedSize: WidgetStateProperty.all(const Size.fromHeight(54)),
        textStyle: WidgetStateProperty.all(Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(
                fontWeight: FontWeight.w700,
                fontFamily: AppConstants.ubuntuFontFamily)),
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))));
  }

  static AppBarTheme appBarTheme(BuildContext context) {
    return AppBarTheme(
        elevation: 0,
        color: Colors.white,
        titleTextStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: AppColors.primaryPink,
            fontFamily: AppConstants.ubuntuFontFamily),
        toolbarTextStyle: TextStyle(color: AppColors.primaryPink));
  }

  static BottomSheetThemeData bottomSheetTheme() => const BottomSheetThemeData(
      dragHandleSize: Size.fromHeight(5),
      dragHandleColor: Color(0xffCDCFD0),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16))));

  static CheckboxThemeData checkboxTheme() => CheckboxThemeData(
      checkColor: WidgetStateProperty.all(Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      side: const BorderSide(color: AppColors.primaryPink));

  static InputDecorationTheme inputDecoration(BuildContext context) {
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide:
            BorderSide(color: Colors.black.withOpacity(0.09), width: 0.5));

    return InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.primaryPink,
            fontFamily: AppConstants.latoFontFamily),
        contentPadding: const EdgeInsets.only(top: 4, left: 16),
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.black.withOpacity(0.45),
            fontFamily: AppConstants.latoFontFamily),
        border: border,
        enabledBorder: border,
        errorStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.red,
            fontFamily: AppConstants.latoFontFamily),
        floatingLabelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.primaryPink,
            fontFamily: AppConstants.latoFontFamily),
        focusedErrorBorder: border.copyWith(
            borderSide: const BorderSide(color: AppColors.red, width: 0.5)),
        errorBorder: border.copyWith(
            borderSide: const BorderSide(color: AppColors.red, width: 0.5)),
        focusedBorder: border);
  }

  static List<BoxShadow> get buttonShadows => [
        const BoxShadow(
            color: Color(0x19000000),
            blurRadius: 24,
            offset: Offset(0, 0),
            spreadRadius: 0)
      ];

  static List<BoxShadow> get iconShadow => [
        const BoxShadow(
            color: Color(0x2D000000),
            blurRadius: 20,
            offset: Offset(0, 0),
            spreadRadius: 0)
      ];

  static List<BoxShadow> get cardShadow => [
        const BoxShadow(
            color: Color(0x11000000),
            blurRadius: 40,
            offset: Offset(0, 0),
            spreadRadius: 0)
      ];

  static TextButtonThemeData textButtonTheme(BuildContext context) {
    return TextButtonThemeData(
        style: buttonStyle(context).copyWith(
            textStyle: WidgetStatePropertyAll(Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(
                    color: AppColors.primaryPink,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppConstants.ubuntuFontFamily))));
  }

  static List<BoxShadow> boxShadowForCustomInfoWindow = [
    const BoxShadow(
        color: Color(0x2D000000),
        blurRadius: 20,
        offset: Offset(25, 0),
        spreadRadius: 0),
    const BoxShadow(
        color: Color(0x2D000000),
        blurRadius: 20,
        offset: Offset(0, 25),
        spreadRadius: 0),
  ];

  static List<BoxShadow> get darkCardShadow => [
        const BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(0, 0),
            blurRadius: 40.0,
            spreadRadius: 0.0)
      ];
}
