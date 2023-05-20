import 'package:flutter/material.dart';
import 'package:music_playlist_app/common/style/app_colors.dart';

class AppStyles {
  AppStyles._();

  static const String appFont = 'Roboto';

  static const double letterSpacing = .8;

  static const h1TextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: letterSpacing,
    color: AppColors.white,
  );

  static const h2TextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    letterSpacing: letterSpacing,
    color: AppColors.white,
  );

  static const normalTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: letterSpacing,
    color: AppColors.white,
  );

  static const subNormalTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    letterSpacing: letterSpacing,
    color: AppColors.white,
  );

  static const buttonTextStyle = TextStyle(
    fontSize: 16,
    color: AppColors.white,
  );

  static const hintTextStyle = TextStyle(
    fontSize: 16,
    color: AppColors.deepGrey,
  );

  static const OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black54, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  );

  static const OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black12, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  );

  static const OutlineInputBorder errorBorder = OutlineInputBorder(
    borderSide: BorderSide(width: 3, color: Colors.redAccent),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  );

  static const OutlineInputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Colors.redAccent),
  );

  static const OutlineInputBorder focusedErrorBorder = OutlineInputBorder(
    borderSide: BorderSide(width: 3, color: Colors.redAccent),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  );
}
