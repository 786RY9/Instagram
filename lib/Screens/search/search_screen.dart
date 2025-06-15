import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram/Widgets/uihelper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

final Random random = Random();

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isLoading = false;
  int page = 1;
  List<String> imageUrls = [];

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchImages();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 300 &&
          !isLoading) {
        fetchImages();
      }
    });
  }

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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 39,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: const Color(0XFF262626),
                    ),
                    child: TextField(
                      controller: _searchController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: Uihelper.CustomImage(
                          imgurl: 'SearchIcon.png',
                        ),
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          color: Color(0XFF8E8E93),
                          fontWeight: FontWeight.normal,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Uihelper.CustomImage(imgurl: 'Live.png'),
              ],
            ),
          ),
          const SizedBox(height: 15),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   child: Row(
          //     children: [
          //       _buildFilterChip('IGTV', 'Icon (1).png'),
          //       _buildFilterChip('Shop', 'Icon (2).png'),
          //       _buildFilterChip('Style'),
          //       _buildFilterChip('Sports'),
          //       _buildFilterChip('Auto'),
          //     ],
          //   ),
          // ),
          // const SizedBox(height: 10),
          Expanded(
            child: MasonryGridView.count(
              controller: _scrollController,
              crossAxisCount: 3,
              mainAxisSpacing: 2.5,
              crossAxisSpacing: 2.5,
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Image.network(
                    imageUrls[index],
                    fit: BoxFit.cover,
                    height: 120 + (index % 10 + 1) * 40, // Randomized height
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, [String? icon]) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 32,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: const Color.fromARGB(25, 255, 255, 255)),
      ),
      child: Row(
        children: [
          if (icon != null) Uihelper.CustomImage(imgurl: icon),
          if (icon != null) const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
