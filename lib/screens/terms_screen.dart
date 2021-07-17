import 'package:flutter/material.dart';
import 'package:mklistui/constants/color.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("약관 및 정책"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              '서비스 이용약관',
              style: TextStyle(
                fontFamily: "NotoSans-Regular",
                fontSize: 14,
                color: color202020,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: color696969,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: TextStyle(
                fontFamily: "NotoSans-Regular",
                fontSize: 14,
                color: color202020,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              '개인정보 보호 정책',
              style: TextStyle(
                fontFamily: "NotoSans-Regular",
                fontSize: 14,
                color: color202020,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: color696969,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: TextStyle(
                fontFamily: "NotoSans-Regular",
                fontSize: 14,
                color: color202020,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              '위치정보 제공 동의',
              style: TextStyle(
                fontFamily: "NotoSans-Regular",
                fontSize: 14,
                color: color202020,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: color696969,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: TextStyle(
                fontFamily: "NotoSans-Regular",
                fontSize: 14,
                color: color202020,
              ),
            )
          ],
        ),
      ),
    );
  }
}
