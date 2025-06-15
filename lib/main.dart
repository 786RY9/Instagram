import 'package:flutter/material.dart';
import 'package:instagram/Screens/Messages/messages_screen.dart';
import 'package:instagram/Screens/Splash/splash_screen.dart';
import 'package:instagram/Screens/bottomnav/bottom_nav_screen.dart';
import 'package:instagram/Screens/home/home_screen.dart';
import 'package:instagram/Screens/profile/profile_screen.dart';
import 'package:instagram/Screens/search/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData.dark(),
      home: BottomNavScreen(),
    );
  }
}
