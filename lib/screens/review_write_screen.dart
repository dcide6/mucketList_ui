import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mklistui/constants/screen_size.dart';
import 'package:mklistui/screens/camera_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class ReviewWriteScreen extends StatefulWidget {
  final File imageFile;
  final String postKey;

  const ReviewWriteScreen({Key key, @required this.postKey, this.imageFile})
      : super(key: key);

  @override
  _ReviewWriteScreenState createState() => _ReviewWriteScreenState();
}

class _ReviewWriteScreenState extends State<ReviewWriteScreen> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('후기 등록'),
      ),
      body: ListView(
        children: [
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
            title: TextField(
              controller: _textEditingController,
              // autofocus: true,
              decoration: InputDecoration(
                hintText: "가게에 대한 후기를 솔직하게 작성해주세요",
                border: InputBorder.none,
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
            title: IconButton(
                icon: Icon(Icons.camera_alt_rounded),
                onPressed: () {
                  _openCamera();
                }),
            leading: Text("사진 첨부"),
            trailing: widget.imageFile == null
                ? null
                : Image.file(
                    widget.imageFile,
                    width: size.width / 6,
                    height: size.width / 6,
                    fit: BoxFit.cover,
                  ),
          ),
        ],
      ),
    );
  }

  void _openCamera() async {
    if (await checkIfPermissionGranted(context))
      Get.to(() => CameraScreen());
    else {
      Get.defaultDialog(
          title: "사진, 파일, 마이크 접근 허용 해주셔야 사용 가능합니다",
          content: TextButton(
              onPressed: () {
                AppSettings.openAppSettings();
              },
              child: Text("권한 설정")));
    }
  }

  Future<bool> checkIfPermissionGranted(BuildContext context) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.microphone,
      Platform.isIOS ? Permission.photos : Permission.storage,
    ].request();
    print(statuses);
    bool permitted = true;
    statuses.forEach((permission, permissionStatus) {
      if (!permissionStatus.isGranted) permitted = false;
    });
    return permitted;
  }
}
