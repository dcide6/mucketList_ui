import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mklistui/constants/color.dart';
import 'package:mklistui/constants/screen_size.dart';
import 'package:mklistui/screens/account_screen.dart';
import 'package:mklistui/screens/alarm_setting_screen.dart';
import 'package:mklistui/screens/deleted_list_screen.dart';
import 'package:mklistui/screens/terms_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool loginStatus = true; //네트워크 : 로그인상태
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
                  child: loginStatus == true
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              '안녕하세요',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '쩝쩝학사', //네트워크 : 닉네임
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: "NotoSans-Medium",
                                  ),
                                ),
                                //별명넣기
                                Text(
                                  ' 님',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '33382water@gmail.com',
                              style: TextStyle(
                                color: color696969,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              child: Text(
                                "로그아웃",
                                style: TextStyle(color: color696969),
                              ),
                              onTap: () {
                                print(loginStatus);
                                setState(() {
                                  loginStatus = false;
                                });
                                //네트워크 : 로그아웃
                              },
                            )
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              '더 많은 맛집 리스트를 위해',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '로그인 해주세요',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: "NotoSans-Medium",
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    print("로그인");
                                    //네트워크-로그인
                                  },
                                  child: Text(
                                    "로그인",
                                    style: TextStyle(color: color696969),
                                  ),
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    //네트워크-회원가입
                                    print("회원가입");
                                  },
                                  child: Text(
                                    "회원가입",
                                    style: TextStyle(color: color696969),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 15,
            ),
            SizedBox(
              height: 5,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: GestureDetector(
                onTap: () {
                  print("버전정보");
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "버전 정보",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "1.0.0",
                            style: TextStyle(fontSize: 18, color: color696969),
                          ), //네트워크 : 버전정보
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: GestureDetector(
                onTap: () {
                  print("회원 정보 수정");
                  Get.to(() => AccountScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "회원 정보 수정",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: GestureDetector(
                onTap: () {
                  print("삭제리스트");
                  Get.to(() => DeletedListScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "삭제리스트",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: GestureDetector(
                onTap: () {
                  print("알림 설정");
                  Get.to(() => AlarmSettingScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "알림 설정",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: GestureDetector(
                onTap: () {
                  print("약관 및 정책");
                  Get.to(() => TermsScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "약관 및 정책",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: GestureDetector(
                onTap: () {
                  print("고객센터");
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "고객센터",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 10,
            )
          ],
        ),
      ),
    ));
  }
}
