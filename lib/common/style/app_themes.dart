import 'package:flutter/material.dart';
import 'package:music_playlist_app/common/style/app_colors.dart';
import 'package:music_playlist_app/common/style/app_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightAppTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: AppColors.deepBLue,
      centerTitle: true,
    ),
    dialogTheme: const DialogTheme(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.deepBLue, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: AppStyles.enabledBorder,
      focusedBorder: AppStyles.focusedBorder,
      errorBorder: AppStyles.errorBorder,
      border: AppStyles.inputBorder,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blueSecondary,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.blueSecondary,
    ),
    fontFamily: AppStyles.appFont,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.white,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey),
        ),
      ),
    ),
    timePickerTheme: TimePickerThemeData(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: Colors.grey, width: 2),
      ),
      dialHandColor: AppColors.blueSecondary,
      hourMinuteColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) => states.contains(MaterialState.selected)
            ? AppColors.blueDiane
            : Colors.black12,
      ),
      hourMinuteTextColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) => states.contains(MaterialState.selected)
            ? Colors.black54
            : Colors.grey,
      ),
      dayPeriodBorderSide: const BorderSide(color: Colors.grey),
      dayPeriodShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      dayPeriodColor: Colors.transparent,
      dayPeriodTextColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) => states.contains(MaterialState.selected)
            ? AppColors.blueDiane
            : Colors.black12,
      ),
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.black12),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    ),
  );
}
