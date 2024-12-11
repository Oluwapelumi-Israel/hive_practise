import 'package:flutter/material.dart';

class MobileLoginLandscape extends StatefulWidget {
  const MobileLoginLandscape({super.key});

  @override
  State<MobileLoginLandscape> createState() => _MobileLoginLandscapeState();
}

class _MobileLoginLandscapeState extends State<MobileLoginLandscape> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Mobile ${MediaQuery.of(context).orientation}"),
      ),
    );
  }
}
