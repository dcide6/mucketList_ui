import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mklistui/constants/color.dart';
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
                  //네트워크 - 회원탈퇴
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomAlertDialog(
                          title: "정말 탈퇴하시겠습니까?",
                        );
                      });
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
}
