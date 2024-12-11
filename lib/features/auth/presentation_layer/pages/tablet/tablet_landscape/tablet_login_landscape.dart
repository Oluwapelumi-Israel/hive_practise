import 'package:flutter/material.dart';


class TabletLoginLandscape extends StatefulWidget {
  const TabletLoginLandscape({super.key});

  @override
  State<TabletLoginLandscape> createState() => _TabletLoginLandscapeState();
}

class _TabletLoginLandscapeState extends State<TabletLoginLandscape> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Tablet ${MediaQuery.of(context).orientation}"),
      ),
    );
  }
}
