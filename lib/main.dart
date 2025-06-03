import 'package:flutter/material.dart';
import 'package:instagram/Screens/Splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      theme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}
