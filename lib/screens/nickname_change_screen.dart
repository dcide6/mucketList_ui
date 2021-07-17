import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mklistui/constants/color.dart';

class NicknameChangeScreen extends StatefulWidget {
  const NicknameChangeScreen({Key key}) : super(key: key);

  @override
  _NicknameChangeScreenState createState() => _NicknameChangeScreenState();
}

class _NicknameChangeScreenState extends State<NicknameChangeScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nickNameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _nickNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("닉네임 변경"),
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                print("검증 완료"); //네트워크 - 닉네임 변경
              }
              Get.back();
            },
            child: Text(
              "저장",
              style: TextStyle(
                fontSize: 20,
                color: color696969,
              ),
            ),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                '닉네임 변경',
                style: TextStyle(
                  fontFamily: "NotoSans-Regular",
                  fontSize: 16,
                  color: color696969,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                cursorColor: color202020,
                controller: _nickNameController,
                validator: (text) {
                  if (text.isNotEmpty) {
                    return null;
                  } else {
                    return '정확한 닉네임을 입력해주세요';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "닉네임은 한글, 영어, 숫자만 가능합니다.",
                style: TextStyle(
                  fontFamily: "NotoSans-Regular",
                  fontSize: 12,
                  color: color696969,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
