import 'package:bank_app/layout_requirement/responsive_layout.dart';
import 'package:bank_app/layout_requirement/sizing_info.dart';
import 'package:flutter/material.dart';

class ScreenType extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  const ScreenType({super.key, required this.mobile, required this.tablet});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      builder: (context, sizing) {
        MediaQueryData mediaQueryData = MediaQuery.of(context);

        if (sizing.getSizingInfo(mediaQueryData) == DeviceScreenType.tablet) {
          return tablet;
        }
        return mobile;
      },
    );
  }
}
