import 'package:flutter/material.dart';
import 'package:mklistui/constants/font_style.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Column(
        children: [Text("FeedScreen",style: AppTextStyle.notoSansBold2026(Colors.black),)],
      ),
    ));
  }
}
