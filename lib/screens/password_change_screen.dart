import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mklistui/constants/color.dart';

class PasswordChangeScreen extends StatefulWidget {
  const PasswordChangeScreen({Key key}) : super(key: key);

  @override
  _PasswordChangeScreenState createState() => _PasswordChangeScreenState();
}

class _PasswordChangeScreenState extends State<PasswordChangeScreen> {
  var passwordfromNetwork = 'gkswhdgh'; //네트워크 - 회원 패스워드
  bool _obscurePassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _newPasswordConfirmController = TextEditingController();

  void _togglePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleObscureNewPassword() {
    setState(() {
      _obscureNewPassword = !_obscureNewPassword;
    });
  }

  void _toggleObscureConfirmPassword() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _passwordController.dispose();
    _newPasswordController.dispose();
    _newPasswordConfirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("비밀번호 변경"),
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                print("검증 완료"); //네트워크 - 비밀번호 변경
              }
              Get.back();
            },
            child: Text(
              "완료",
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
                '현재 비밀번호',
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
                controller: _passwordController,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _togglePassword();
                      });
                    },
                    child: Icon(Icons.remove_red_eye_rounded),
                  ),
                ),
                obscureText: _obscurePassword,
                validator: (text) {
                  if (text.isNotEmpty && text == passwordfromNetwork) {
                    return null;
                  } else {
                    return '비밀번호가 일치하지 않습니다.';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "비밀번호를 잊으셨나요?",
                style: TextStyle(
                  fontFamily: "NotoSans-Regular",
                  fontSize: 12,
                  color: colorFFD74A,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                '새 비밀번호',
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
                controller: _newPasswordController,
                obscureText: _obscureNewPassword,
                decoration: InputDecoration(
                  hintText: "8~16자 영문, 숫자, 특수문자 사용",
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _toggleObscureNewPassword();
                      });
                    },
                    child: Icon(Icons.remove_red_eye_rounded),
                  ),
                ),
                validator: (text) {
                  if (text.isNotEmpty && text.length >= 8) {
                    return null;
                  } else {
                    return '비밀번호 형식이 올바르지 않습니다.';
                  }
                },
              ),
              SizedBox(
                height: 45,
              ),
              Text(
                '새 비밀번호 확인',
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
                controller: _newPasswordConfirmController,
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  hintText: "8~16자 영문, 숫자, 특수문자 사용",
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _toggleObscureConfirmPassword();
                      });
                    },
                    child: Icon(Icons.remove_red_eye_rounded),
                  ),
                ),
                validator: (text) {
                  if (text.isNotEmpty &&
                      text.length >= 8 &&
                      _newPasswordController.text == text) {
                    return null;
                  } else {
                    return '입력한 값이 일치하지 않습니다.';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
