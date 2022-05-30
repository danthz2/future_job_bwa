import 'dart:async';

import 'package:flutter/material.dart';
import 'package:future_job/services/themes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1),
        () => Navigator.pushReplacementNamed(context, '/getstarted'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: purpleC,
        body: Center(
          child: Image.asset(
            "assets/image_splash.png",
            width: 182,
          ),
        ));
  }
}
