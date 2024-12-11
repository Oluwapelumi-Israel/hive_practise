import 'package:flutter/material.dart';

class OrientationType extends StatelessWidget {
  final Widget landscape;
  final Widget portrait;
  const OrientationType(
      {super.key, required this.landscape, required this.portrait});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    if(orientation == Orientation.portrait)
      {
        return portrait;
      }
    return landscape;
  }
}
