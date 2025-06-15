import 'package:flutter/material.dart';
import 'package:instagram/Widgets/uihelper.dart';

class ProfilePostsScreen extends StatelessWidget {
  const ProfilePostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var arrContent = [
      {'img': 'pic1.jpg'},
      {'img': 'pic2.png'},
      {'img': 'pic3.png'},
      {'img': 'pic4.png'},
      {'img': 'pic1.jpg'},
      {'img': 'pic2.png'},
      {'img': 'pic3.png'},
      {'img': 'pic4.png'},
      {'img': 'pic1.jpg'},
      {'img': 'pic2.png'},
      {'img': 'pic3.png'},
      {'img': 'pic4.png'},
    ];
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: arrContent.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
            clipBehavior: Clip.antiAlias,
            height: 124,
            width: 124,
            child: Image.asset(
              'assets/image/${arrContent[index]['img'].toString()}',
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
