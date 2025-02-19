import 'package:flutter/material.dart';

abstract class TextStyles {
  static TextStyle styleCairo20(context) {
    return TextStyle(
      color: const Color(0xFF252525),
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w700, // Bold
    );
  }

  static TextStyle styleCairo34(context) {
    return TextStyle(
      color: const Color(0xFF252525),
      fontSize: getResponsiveFontSize(context, fontSize: 34),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w700, // Bold
    );
  }

  static TextStyle styleCairo15(context) {
    return TextStyle(
      color: const Color(0xFF252525),
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w500, // Bold
    );
  }
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .7;
  double upperLimit = fontSize * 1.1;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < 400) {
    // SizeConfig.tablet
    return width / 550;
  } else if (width < 700) {
    //SizeConfig.desktop
    return width / 1000;
  } else {
    return width / 1920;
  }
}
