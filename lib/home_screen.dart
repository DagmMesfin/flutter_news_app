import 'package:flutter/material.dart';
import 'package:news_app/pages/bookmark.dart';
import 'package:news_app/pages/discover.dart';
import 'package:news_app/pages/homepage.dart';
import 'package:news_app/pages/profile_page.dart';
import 'package:news_app/pages/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> pages = [
    HomePage(),
    DiscoverPage(),
    BookmarkPage(),
    ProfilePage(),
  ];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 12, 12, 12),
          selectedItemColor: const Color.fromARGB(255, 24, 24, 24),
          unselectedItemColor: const Color.fromARGB(255, 137, 135, 135),
          iconSize: 35,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_outward_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_3_rounded),
              label: '',
            ),
          ]),
    );
  }
}
