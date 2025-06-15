import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/Widgets/uihelper.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    var arrContent = [
      {
        'img': 'instagram.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
      {
        'img': 'person.png',
        'name': 'joshua_l',
        'lastmsg': 'Have a nice day, bro!',
      },
    ];

    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.back)),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sujal_dave',
              style: TextStyle(
                fontSize: 16,
                color: Color(0XFFF9F9F9),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 4),
            ImageIcon(
              AssetImage('assets/image/Accounts List.png'),
              color: Color(0XFFF9F9F9),
              size: 25,
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
            iconSize: 25,
            color: Colors.white,
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(width: screenwidth * 0.05),
              Container(
                height: 40,
                width: screenwidth * 0.9,
                decoration: BoxDecoration(
                  color: Color(0XFF262626),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color(0XFF8E8E93),
                      ),
                      prefixIcon: Uihelper.CustomImage(
                        imgurl: 'SearchIcon.png',
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(width: screenwidth * 0.05),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: arrContent.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      'assets/image/${arrContent[index]['img'].toString()}',
                    ),
                  ),

                  title: Text(
                    arrContent[index]['name'].toString(),
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    arrContent[index]['lastmsg'].toString(),
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  trailing: Icon(Icons.camera_alt_outlined),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 60,
        width: double.infinity,

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(158, 16, 15, 15),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.camera_alt, color: Colors.blue, size: 25),

              SizedBox(width: 5),

              Padding(
                padding: const EdgeInsets.only(bottom: 0.5),
                child: Text(
                  'Camera',
                  style: TextStyle(fontSize: 15, color: Color(0XFF3897F0)),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
