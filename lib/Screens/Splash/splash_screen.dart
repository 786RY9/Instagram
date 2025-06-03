import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instagram/Screens/Login/login_Screen.dart';
import 'package:instagram/Widgets/uihelper.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Uihelper.CustomImage(imgurl: 'instagram.png'),
            SizedBox(height: 10),
            Uihelper.CustomImage(imgurl: 'TextLogo.png'),
          ],
        ),
      ),
    );
  }
}
