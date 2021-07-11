import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mklistui/screens/feed_screen.dart';
import 'package:mklistui/screens/list_screen.dart';
import 'package:mklistui/screens/profile_screen.dart';
import 'package:mklistui/widgets/random_pick_dialog.dart';
import 'package:shake/shake.dart';
import 'constants/screen_size.dart';
import 'package:sensors/sensors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ShakeDetector detector;
  List<BottomNavigationBarItem> btmNavItems = [
    BottomNavigationBarItem(
        icon: SvgPicture.asset("assets/icons/얌얌리스트.svg"), label: '얌얌리스트'),
    BottomNavigationBarItem(
        icon: SvgPicture.asset("assets/icons/여기얌.svg"), label: '여기얌'),
    BottomNavigationBarItem(
        icon: SvgPicture.asset("assets/icons/나얌.svg"), label: '나얌'),
  ];

  int _selectedIndex = 0;
  GlobalKey<ScaffoldState> _key = GlobalKey();

  static List<Widget> _screens = [
    ListScreen(),
    FeedScreen(),
    ProfileScreen(),
  ];
  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.autoStart(onPhoneShake: () {
      Get.to(
          () => RandomPickDialog(pickedList: "햄버거", pickedListInfo: "맛있습니다"));
      // 왜 팝업 바깥화면이 검은색인지 모르겠습니다...
    });
  }

  @override
  Widget build(BuildContext context) {
    if (size == null) size = MediaQuery.of(context).size;
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
