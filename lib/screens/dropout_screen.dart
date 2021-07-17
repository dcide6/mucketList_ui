import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mklistui/constants/color.dart';
import 'package:mklistui/home_page.dart';
import 'package:mklistui/screens/profile_screen.dart';
import 'package:mklistui/widgets/custom_alert_dialog.dart';

class DropoutScreen extends StatelessWidget {
  const DropoutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("회원탈퇴"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                '회원 탈퇴 유의사항',
                style: TextStyle(
                  fontFamily: "NotoSans-Bold",
                  fontSize: 14,
                  color: colorFF3535,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '회원 탈퇴를 하실 경우 등록하신 모든 얌얌리스트가 삭제되며 이후 복구가 불가능합니다.',
              style: TextStyle(
                fontFamily: "NotoSans-Regular",
                fontSize: 14,
                color: color696969,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '회원 탈퇴를 진행하셔도 업체에 대해 등록해주신 후기는 유지되오니 반드시 유의하시기 바랍니다.',
              style: TextStyle(
                fontFamily: "NotoSans-Regular",
                fontSize: 14,
                color: color696969,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            ButtonTheme(
              minWidth: double.infinity,
              height: 42,
              child: MaterialButton(
                color: colorD9D9D9,
                onPressed: () {
                  _showDropoutDialog(context);
                },
                child: Text(
                  '회원탈퇴',
                  style: TextStyle(
                    fontSize: 16,
                    color: colorFFFFFF,
                    fontFamily: "NotoSans-Medium",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showDropoutDialog(context) {
    showDialog(
        context: context,
        builder: (_) => Dialog(
              elevation: 0,
              backgroundColor: colorFFFFFF,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 15),
                  Text(
                    "정말 탈퇴하시겠습니까?",
                    style: TextStyle(
                      fontFamily: "NotoSans-Regular",
                      fontSize: 14,
                      color: color696969,
                    ),
                  ),
                  SizedBox(height: 15),
                  Divider(
                    height: 1,
                  ),
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: Center(
                            child: Text(
                              "취소",
                              style: TextStyle(
                                fontFamily: "NotoSans-Regular",
                                fontSize: 14,
                                color: color696969,
                              ),
                            ),
                          ),
                          onTap: () {
                            Get.back();
                          },
                        ),
                        VerticalDivider(
                          width: 1,
                        ),
                        InkWell(
                          child: Center(
                            child: Text(
                              "탈퇴",
                              style: TextStyle(
                                fontFamily: "NotoSans-Regular",
                                fontSize: 14,
                                color: color696969,
                              ),
                            ),
                          ),
                          onTap: () {
                            _showConfirmDialog(context);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }

  _showConfirmDialog(context) {
    showDialog(
        context: context,
        builder: (_) => Dialog(
              elevation: 0,
              backgroundColor: colorFFFFFF,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 15),
                  Text(
                    "회원탈퇴가 완료되었습니다.",
                    style: TextStyle(
                      fontFamily: "NotoSans-Regular",
                      fontSize: 14,
                      color: color696969,
                    ),
                  ),
                  SizedBox(height: 15),
                  Divider(
                    height: 1,
                  ),
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: Center(
                            child: Text(
                              "확인",
                              style: TextStyle(
                                fontFamily: "NotoSans-Regular",
                                fontSize: 14,
                                color: color696969,
                              ),
                            ),
                          ),
                          onTap: () {
                            Get.offAll(HomePage());
                            //사용자 삭제하고 홈페이지로
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
