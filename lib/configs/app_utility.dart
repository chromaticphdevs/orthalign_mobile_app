import 'package:flutter/material.dart';

class AppUtility {
  // Design reference dimensions (iPhone 11)
  // static const double _designWidth = 414.0;
  // static const double _designHeight = 896.0;

  static const double _designWidth = 430.0;
  static const double _designHeight = 932.0;

  /// Scales a horizontal size based on actual screen width vs design width.
  static double getHorizontalSize(BuildContext context, double px) {
    final screenWidth = MediaQuery.of(context).size.width;
    return px * (screenWidth / _designWidth);
  }

  /// Scales a vertical size based on actual screen height vs design height.
  static double getVerticalSize(BuildContext context, double px) {
    final screenHeight = MediaQuery.of(context).size.height;
    return px * (screenHeight / _designHeight);
  }

  /// Returns the current device screen size.
  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  /// Returns a scaled font size based on screen width.
  static double getFontSize(BuildContext context, double fontSize) {
    final screenWidth = MediaQuery.of(context).size.width;
    return fontSize * (screenWidth / _designWidth);
  }
}
