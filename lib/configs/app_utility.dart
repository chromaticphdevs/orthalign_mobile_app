import 'package:flutter/material.dart';

class AppUtility {

  static Size size = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.first).size;
  // static Size size = WidgetsBinding.instance.window.physicalSize /
  //     WidgetsBinding.instance.window.devicePixelRatio;

  ///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
  static double getHorizontalSize(double px) {
    return px * (size.width / 375);
  }

  ///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
  static double getVerticalSize(double px) {
    num statusBar = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.first)
        .viewPadding
        .top;
    num screenHeight = size.height - statusBar;
    return px * (screenHeight / 768.0);
  }
}
