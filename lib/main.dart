import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mklistui/constants/material_white.dart';
import 'package:mklistui/screens/review_write_screen.dart';
import 'package:mklistui/widgets/random_pick_dialog.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
