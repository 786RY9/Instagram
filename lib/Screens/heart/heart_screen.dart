import 'package:flutter/material.dart';
import 'package:instagram/Screens/heart/Following/following_screen.dart';
import 'package:instagram/Screens/heart/You/you_screen.dart';

class HeartScreen extends StatelessWidget {
  const HeartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [Tab(text: 'Following'), Tab(text: 'You')],
          ),
        ),

        body: TabBarView(children: [FollowingScreen(), YouScreen()]),
      ),
    );
  }
}
