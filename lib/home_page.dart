import 'package:flutter/material.dart';
import 'package:mklistui/screens/feed_screen.dart';
import 'package:mklistui/screens/list_screen.dart';
import 'package:mklistui/screens/profile_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> btmNavItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.sticky_note_2_rounded), label: '얌얌리스트'),
    BottomNavigationBarItem(
        icon: Icon(Icons.star_border_outlined), label: '여기얌'),
    BottomNavigationBarItem(icon: Icon(Icons.account_box_rounded), label: '나얌'),
  ];

  int _selectedIndex = 0;
  GlobalKey<ScaffoldState> _key = GlobalKey();

  static List<Widget> _screens = [
    ListScreen(),
    FeedScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          iconSize: 30.0,
          items: btmNavItems,
          selectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
