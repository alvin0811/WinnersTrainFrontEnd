// ignore_for_file: deprecated_member_use

import 'package:winner_trains_app/utils/basic_exports.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    splashFactory: NoSplash.splashFactory,
    splashColor: Colors.transparent,
    colorScheme: AppColor.lightScheme,
    // useMaterial3: false,
    textTheme: GoogleFonts.latoTextTheme(AppText.theme),
    scaffoldBackgroundColor: AppColor.lightScheme.background,
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        shadowColor: MaterialStatePropertyAll(
          AppColor.lightScheme.onPrimary.withOpacity(
            0.2,
          ),
        ),
        overlayColor: MaterialStatePropertyAll(
          AppColor.lightScheme.onPrimary.withOpacity(
            0.2,
          ),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0.0, // Disable elevation when scrolling
      elevation: 0.0, // No shadow
      backgroundColor: Colors.transparent, // Set a fixed transparent color
      shadowColor: Colors.transparent, // Ensure shadow is fully disabled
      surfaceTintColor: Colors.transparent, // Disable Material 3 surface tint
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme:
          IconThemeData(color: AppColor.lightScheme.primary, size: 24),
      selectedItemColor: AppColor.lightScheme.primary,
      unselectedIconTheme:
          IconThemeData(color: AppColor.lightScheme.primary, size: 24),
      selectedLabelStyle: TextStyle(
          color: AppColor.lightScheme.primary,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400),
      unselectedLabelStyle: TextStyle(
          color: AppColor.lightScheme.primary,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: AppColor.lightScheme.primary,
    ),
    buttonTheme: ButtonThemeData(
      colorScheme: AppColor.lightScheme,
//       hoverColor: AppColor.lightScheme.primary.withOpacity(0.5),
// splashColor: AppColor.lightScheme.primary.withOpacity(0.5),
    ),
    iconTheme: IconThemeData(
      color: AppColor.lightScheme.primary,
    ),
    // tabBarTheme: TabBarTheme(
    //   tabAlignment: TabAlignment.fill,
    //   dividerColor: Colors.transparent,
    //   unselectedLabelStyle: AppText.theme.titleMedium?.copyWith(
    //     fontWeight: FontWeight.w900,
    //     color: AppColor.lightScheme.onBackground,
    //   ),
    //   labelStyle: AppText.theme.titleMedium?.copyWith(
    //     fontWeight: FontWeight.w900,
    //     color: AppColor.lightScheme.onPrimary,
    //   ),
    //   labelPadding: EdgeInsets.zero,
    //   indicatorSize: TabBarIndicatorSize.tab,
    //   indicator: BoxDecoration(
    //     color: AppColor.lightScheme.primary,
    //     borderRadius: BorderRadius.circular(4.r),
    //   ),
    // ),
    datePickerTheme: DatePickerThemeData(
        backgroundColor: AppColor.lightScheme.background,
        headerForegroundColor: AppColor.lightScheme.primary),
  );
}
