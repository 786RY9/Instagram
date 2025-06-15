import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/Screens/heart/heart_screen.dart';
import 'package:instagram/Screens/home/home_screen.dart';
import 'package:instagram/Screens/posts/posts_screen.dart';
import 'package:instagram/Screens/profile/profile_screen.dart';
import 'package:instagram/Screens/search/search_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;

  // Create a GlobalKey for each Navigator
  final _homeNavKey = GlobalKey<NavigatorState>();
  final _searchNavKey = GlobalKey<NavigatorState>();
  final _postsNavKey = GlobalKey<NavigatorState>();
  final _heartNavKey = GlobalKey<NavigatorState>();
  final _profileNavKey = GlobalKey<NavigatorState>();

  // Map each tab to its navigator key and initial page.
  List<Widget> get pages => [
    _buildOffstageNavigator(_homeNavKey, 0, HomeScreen()),
    _buildOffstageNavigator(_searchNavKey, 1, const SearchScreen()),
    _buildOffstageNavigator(_postsNavKey, 2, const PostsScreen()),
    _buildOffstageNavigator(_heartNavKey, 3, const HeartScreen()),
    _buildOffstageNavigator(_profileNavKey, 4, const ProfileScreen()),
  ];

  Widget _buildOffstageNavigator(
    GlobalKey<NavigatorState> navigatorKey,
    int index,
    Widget child,
  ) {
    return Offstage(
      offstage: currentIndex != index,
      child: Navigator(
        key: navigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (_) => child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == currentIndex) {
            // Pop to first route if the current tab is tapped again
            switch (index) {
              case 0:
                _homeNavKey.currentState?.popUntil((route) => route.isFirst);
                break;
              case 1:
                _searchNavKey.currentState?.popUntil((route) => route.isFirst);
                break;
              case 2:
                _postsNavKey.currentState?.popUntil((route) => route.isFirst);
                break;
              case 3:
                _heartNavKey.currentState?.popUntil((route) => route.isFirst);
                break;
              case 4:
                _profileNavKey.currentState?.popUntil((route) => route.isFirst);
                break;
            }
          } else {
            setState(() {
              currentIndex = index;
            });
          }
        },
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Search', icon: Icon(Icons.search)),
          BottomNavigationBarItem(
            label: 'Post',
            icon: Icon(CupertinoIcons.plus_app),
          ),
          BottomNavigationBarItem(
            label: 'Liked',
            icon: Icon(CupertinoIcons.heart),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(CupertinoIcons.profile_circled),
          ),
        ],
      ),
      body: Stack(children: pages),
    );
  }
}
