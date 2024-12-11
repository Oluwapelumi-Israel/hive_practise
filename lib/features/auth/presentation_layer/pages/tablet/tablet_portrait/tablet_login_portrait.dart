import 'package:flutter/material.dart';

class TabletLoginPortrait extends StatefulWidget {
  const TabletLoginPortrait({super.key});

  @override
  State<TabletLoginPortrait> createState() => _TabletLoginPortraitState();
}

class _TabletLoginPortraitState extends State<TabletLoginPortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Tablet ${MediaQuery.of(context).orientation}"),
      ),
    );
  }
}
