import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instagram/Screens/Messages/messages_screen.dart';
import 'package:instagram/Widgets/uihelper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

final Random random = Random();

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;

  int page = 1;

  List<String> imageUrls = [];

  Future<void> fetchImages() async {
    setState(() => isLoading = true);
    int randomPage = random.nextInt(100) + 1;

    final response = await http.get(
      Uri.parse('https://picsum.photos/v2/list?page=$randomPage&limit=20'),
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      setState(() {
        imageUrls.addAll(data.map((img) => img['download_url'] as String));
        page++;
        isLoading = false;
      });
    } else {
      setState(() => isLoading = false);
      throw Exception('Failed to load images');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  String getAvatarName(int index) {
    if (index == 0) return 'Your Story';
    // a small base list and then append an index-based suffix to generate “infinite” names.
    List<String> baseNames = [
      'anna',
      'brad',
      'charlie',
      'diana',
      'eric',
      'fiona',
      'george',
      'hannah',
    ];
    return '${baseNames[index % baseNames.length]}_${index ~/ baseNames.length}';
  }

  @override
  Widget build(BuildContext context) {
    // index for the featured image ensuring it doesn't exceed imageUrls.length
    int randomPage =
        imageUrls.isNotEmpty ? random.nextInt(imageUrls.length) : 0;

    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.black12,
        leading: Uihelper.CustomImage(imgurl: 'Camera Icon.png'),
        title: Uihelper.CustomImage(imgurl: 'Instagram Logo.png'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Uihelper.CustomImage(imgurl: "IGTV.png"),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessagesScreen()),
              );
            },
            icon: Uihelper.CustomImage(imgurl: 'Messanger.png'),
          ),
        ],
      ),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : imageUrls.isEmpty
              ? Center(child: Text('No images found.'))
              : Column(
                children: [
                  SizedBox(
                    height: 110,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: ListView.builder(
                        itemCount: imageUrls.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    47,
                                    44,
                                    44,
                                  ),
                                  child: ClipOval(
                                    child: SizedBox(
                                      width: 60,
                                      height: 60,
                                      child: Image.network(
                                        imageUrls[index],
                                        fit: BoxFit.cover,
                                        loadingBuilder: (
                                          context,
                                          child,
                                          loadingProgress,
                                        ) {
                                          if (loadingProgress == null)
                                            return child;
                                          return Center(
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                            ),
                                          );
                                        },
                                        errorBuilder: (
                                          context,
                                          error,
                                          stackTrace,
                                        ) {
                                          return Icon(Icons.error, size: 30);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  getAvatarName(index),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 54,
                    width: screenWidth,
                    color: Colors.black12,
                    child: ListTile(
                      leading: Uihelper.CustomImage(imgurl: 'person.png'),
                      title: Text(
                        'joshua_l',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0XFFF9F9F9),
                        ),
                      ),
                      subtitle: Text(
                        'Tokyo, Japan',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0XFFF9F9F9),
                        ),
                      ),
                      trailing: Uihelper.CustomImage(imgurl: 'More Icon.png'),
                    ),
                  ),
                  Container(
                    height: 375,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Image.network(
                      imageUrls[randomPage],
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.error, size: 30);
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Uihelper.CustomImage(imgurl: 'Like.png'),
                      SizedBox(width: 20),
                      Uihelper.CustomImage(imgurl: 'Messanger.png'),
                      SizedBox(width: 20),
                      Uihelper.CustomImage(imgurl: 'Comment.png'),
                      Spacer(), // takes up remaining space
                      Uihelper.CustomImage(imgurl: 'Save.png'),
                      SizedBox(width: 20),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Uihelper.CustomImage(imgurl: 'Oval.png'),
                      SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          'Liked by sujal_dave and 44,686 others',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0XFFF9F9F9),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Text(
                        'sujal_dave',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFFF9F9F9),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'The game in Japan was amazing and I want to share some photos',
                          style: TextStyle(
                            fontSize: 13,

                            color: Color(0XFFF9F9F9),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
    );
  }
}
