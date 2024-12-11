import 'package:bank_app/layout_requirement/sizing_info.dart';
import 'package:flutter/material.dart';


class ResponsiveLayout extends StatelessWidget {
  final Widget Function(BuildContext context, Sizing sizing) builder;
  const ResponsiveLayout({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    Sizing measurement = Sizing();
    return builder(context, measurement);
  }
}
