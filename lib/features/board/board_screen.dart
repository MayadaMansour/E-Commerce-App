import 'dart:async';
import 'package:flutter/material.dart';

import '../register_login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = "Splash_Screen";
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image(
          image: AssetImage(
            "assets/images/splash.png",
          ),
          fit: BoxFit.fill,
        ));
  }
}
