

import 'package:flutter/cupertino.dart';

enum DeviceScreenType{mobile, tablet}


class Sizing
{
  DeviceScreenType? screenType;

  DeviceScreenType? getSizingInfo(MediaQueryData mediaQuery)
  {
    double size = mediaQuery.size.shortestSide;

    if(size > 600)
      {
        screenType = DeviceScreenType.tablet;
      }
    else
      {
        screenType = DeviceScreenType.mobile;
      }

    return screenType;
  }
}