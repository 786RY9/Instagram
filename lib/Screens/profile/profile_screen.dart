import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/Screens/profile/profile_posts_screen.dart';
import 'package:instagram/Screens/profile/tags_screen.dart';
import 'package:instagram/Widgets/uihelper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,

      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(CupertinoIcons.lock_fill, size: 13),
              // Uihelper.CustomImage(imgurl: 'lock.png'),
              SizedBox(width: 5),
              Text(
                'jacob_w',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu, size: 30),

              // Uihelper.CustomImage(imgurl: 'Shape.png'),
            ),
            SizedBox(width: 4),
          ],
        ),

        body: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 25),
                CircleAvatar(
                  radius: 48,
                  backgroundImage: AssetImage('assets/image/mypic.jpeg'),
                ),

                SizedBox(width: 50),
                Column(
                  children: [
                    Text(
                      '54',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Posts',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 60),
                Column(
                  children: [
                    Text(
                      '834',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Followers',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 60),
                Column(
                  children: [
                    Text(
                      '162',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Following',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rashid Yaseen',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      'Linux System Administrator',
                      style: TextStyle(fontSize: 13),
                    ),
                    Text('Flutter X DevOps', style: TextStyle(fontSize: 13)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 40,
              width: screenwidth * 0.95,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Text(
                  'Edit Profile',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 20),
                Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        border: Border.all(color: Colors.grey.shade700),
                      ),
                      child: Icon(Icons.add, size: 50, color: Colors.white70),
                    ),
                    SizedBox(height: 4),
                    Text('New', style: TextStyle(fontSize: 12)),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade700),
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/image/zinda.png'),
                      ),
                    ),

                    SizedBox(height: 4),
                    Text('New', style: TextStyle(fontSize: 12)),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade700),
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                          'assets/image/Earth_image.jpg',
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text('New', style: TextStyle(fontSize: 12)),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade700),
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                          'assets/image/MyPicture.jpeg',
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text('New', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 50,
              child: AppBar(
                bottom: TabBar(
                  indicatorColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(icon: Icon(Icons.grid_on_outlined)),
                    Tab(icon: Icon(Icons.person_pin_outlined)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2),
            Expanded(
              child: TabBarView(children: [ProfilePostsScreen(), TagsScreen()]),
            ),
          ],
        ),
      ),
    );
  }
}
