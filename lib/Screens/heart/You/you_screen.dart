import 'package:flutter/material.dart';
import 'package:instagram/Widgets/uihelper.dart';

class YouScreen extends StatelessWidget {
  const YouScreen({super.key});

  // Widget to build section header text
  Widget sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white, // Dark mode text
        ),
      ),
    );
  }

  // Widget to build each activity item
  Widget activityItem({
    required String avatarPath,
    required String activityText,
    String? trailingImage,
    bool showMessageButton = false,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      leading: CircleAvatar(
        radius: 28,
        backgroundImage: AssetImage(avatarPath),
      ),
      title: Text(
        activityText,
        style: const TextStyle(fontSize: 13, color: Colors.white),
      ),
      trailing:
          trailingImage != null
              ? Container(
                height: 60,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: AssetImage(trailingImage),
                    fit: BoxFit.cover,
                  ),
                ),
              )
              : showMessageButton
              ? Container(
                height: 30,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: Colors.grey),
                ),
                child: const Center(
                  child: Text(
                    'Message',
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ),
              )
              : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Activity',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFFF9F9F9),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          // Follow Requests header
          Container(
            height: 0,
            width: double.infinity,
            // color: const Color.fromARGB(207, 19, 18, 18),
            // padding: const EdgeInsets.only(top: 15, left: 20),
            alignment: Alignment.centerLeft,
            // child: const Text(
            //   'Follow Requests',
            //   style: TextStyle(fontSize: 15, color: Color(0xFFF9F9F9)),
            // ),
          ),
          const Divider(height: 1, color: Colors.grey),
          // New section
          sectionHeader('New'),
          activityItem(
            avatarPath: 'assets/image/pic2.png',
            activityText: 'max_jacobson started following you. 3d',
            trailingImage: 'assets/image/pic1.jpg',
          ),
          SizedBox(height: 8),
          // Today section
          sectionHeader('Today'),
          activityItem(
            avatarPath: 'assets/image/pic3.png',
            activityText: 'max_jacobson liked your post. 2h',
            trailingImage: 'assets/image/pic4.png',
          ),
          SizedBox(height: 8),

          // This Week section
          sectionHeader('This Week'),
          activityItem(
            avatarPath: 'assets/image/pic4.png',
            activityText: 'max_jacobson started following you. 3d',
            showMessageButton: true,
          ),
          SizedBox(height: 10),
          activityItem(
            avatarPath: 'assets/image/pic3.png',
            activityText: 'max_jacobson started following you. 3d',
            showMessageButton: true,
          ),
          SizedBox(height: 10),
          activityItem(
            avatarPath: 'assets/image/pic2.png',
            activityText: 'max_jacobson liked your post. 5d',
            trailingImage: 'assets/image/pic1.jpg',
          ),
          // This Month section
          SizedBox(height: 8),
          sectionHeader('This Month'),
          activityItem(
            avatarPath: 'assets/image/pic1.jpg',
            activityText: 'max_jacobson started following you. 3d',
            trailingImage: 'assets/image/pic4.png',
          ),
        ],
      ),
    );
  }
}
