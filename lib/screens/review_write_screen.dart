import 'dart:io';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mklistui/constants/color.dart';
import 'package:mklistui/constants/screen_size.dart';
import 'package:mklistui/screens/camera_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';

class ReviewWriteScreen extends StatefulWidget {
  final File imageFile;
  final String postKey;
  const ReviewWriteScreen({Key key, @required this.postKey, this.imageFile})
      : super(key: key);

  @override
  _ReviewWriteScreenState createState() => _ReviewWriteScreenState();
}

class _ReviewWriteScreenState extends State<ReviewWriteScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _visitingDateController = TextEditingController();
  TextEditingController _visitingTimeController = TextEditingController();
  TextEditingController _visitingWithwhoController = TextEditingController();
  TextEditingController _reviewController = TextEditingController();
  DateTime _selectedDate;
  File _uploadFile;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _visitingDateController.dispose();
    _visitingDateController.dispose();
    _visitingTimeController.dispose();
    _visitingWithwhoController.dispose();
    _reviewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '후기 등록',
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              height: size.height / 6,
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 15,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "방문 날짜",
                    style: TextStyle(
                      fontFamily: "NotoSans-Regular",
                      fontSize: 16,
                      color: color696969,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    width: size.width * 3 / 5,
                    child: TextFormField(
                      showCursor: true,
                      readOnly: true,
                      controller: _visitingDateController,
                      onTap: () {
                        _presentDatePicker();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "방문 시간",
                    style: TextStyle(
                      fontFamily: "NotoSans-Regular",
                      fontSize: 16,
                      color: color696969,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    width: size.width * 3 / 5,
                    child: TextFormField(
                      showCursor: true,
                      readOnly: true,
                      controller: _visitingTimeController,
                      onTap: () {
                        _showBottomSheet();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "누구와     ",
                    style: TextStyle(
                      fontFamily: "NotoSans-Regular",
                      fontSize: 16,
                      color: color696969,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    width: size.width * 3 / 5,
                    child: TextFormField(
                      showCursor: true,
                      readOnly: true,
                      controller: _visitingWithwhoController,
                      onTap: () {
                        print("ontap");
                        _showBottomScrollSheet();
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                child: TextField(
                  textAlign: TextAlign.start,
                  controller: _reviewController,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(10.0, 70.0, 10.0, 20.0),
                    hintText: "가게에 대한 후기를 솔직하게 작성해주세요",
                    hintStyle: TextStyle(
                      fontFamily: "NotoSans-Regular",
                      fontSize: 16,
                      color: color696969,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            _uploadFile == null
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.photo_camera_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "사진 첨부",
                              style: TextStyle(
                                fontFamily: "NotoSans-Regular",
                                fontSize: 16,
                                color: color696969,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          _openCamera();
                        }),
                  )
                : SizedBox(
                    height: 5,
                  ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        _uploadFile == null
                            ? Text("")
                            : Image.file(
                                _uploadFile,
                                width: size.width / 4,
                                height: size.width / 4,
                                fit: BoxFit.cover,
                              ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -15,
                    right: 260,
                    child: _uploadFile != null
                        ? IconButton(
                            icon: Icon(
                              Icons.cancel,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                _uploadFile = null;
                              });
                            },
                          )
                        : Container(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SectionSwitch('공개 여부'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "작성한 후기의 공개여부를 설정할 수 있습니다.",
                style: TextStyle(
                  fontFamily: "NotoSans-Regular",
                  fontSize: 14,
                  color: color696969,
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            ButtonTheme(
              minWidth: double.infinity,
              height: 55,
              child: MaterialButton(
                color: colorFFD74A,
                onPressed: () {},
                child: Text('작성완료'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openCamera() async {
    if (await checkIfPermissionGranted(context)) {
      var pic = await Get.to(() => CameraScreen());
      print(pic);
      setState(() {
        _uploadFile = pic;
      });
    } else {
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

  void _presentDatePicker() {
    showDatePicker(
        locale: const Locale('ko', "KR"),
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: colorFFD74A, // header background color
                  onPrimary: colorFFFFFF, // header text color
                  onSurface: color202020, // body text color
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    primary: colorFFD74A, // button text color
                  ),
                ),
              ),
              child: child);
        }).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
        _visitingDateController.text = DateFormat.yMd().format(_selectedDate);
      });
    });
  }

  void _showBottomSheet() => showModalBottomSheet(
        enableDrag: false,
        isDismissible: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "방문시간",
                style: TextStyle(
                  fontFamily: "NotoSans-Bold",
                  fontSize: 18,
                  color: color202020,
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 0,
            ),
            ListTile(
              title: Text(
                "아침",
                style: TextStyle(color: color202020),
              ),
              onTap: () {
                setState(() {
                  _visitingTimeController.text = "아침";
                });
                Get.back();
              },
            ),
            ListTile(
              title: Text(
                "점심",
                style: TextStyle(color: color202020),
              ),
              onTap: () {
                _visitingTimeController.text = "점심";
                Get.back();
              },
            ),
            ListTile(
              title: Text(
                "저녁",
                style: TextStyle(color: color202020),
              ),
              onTap: () {
                _visitingTimeController.text = "저녁";
                Get.back();
              },
            ),
            Container(
              height: 42,
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: colorD9D9D9),
              ),
              child: GestureDetector(
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "닫기",
                        style: TextStyle(
                          fontFamily: "NotoSans-Bold",
                          fontSize: 16,
                          color: color202020,
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
      );
  void _showBottomScrollSheet() => showModalBottomSheet(
        enableDrag: false,
        isDismissible: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "누구와",
                style: TextStyle(
                  fontFamily: "NotoSans-Bold",
                  fontSize: 18,
                  color: color202020,
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 0,
            ),
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                ListTile(
                  title: Text(
                    "혼자",
                    style: TextStyle(color: color202020),
                  ),
                  onTap: () {
                    setState(() {
                      _visitingWithwhoController.text = "혼자";
                    });
                    Get.back();
                  },
                ),
                ListTile(
                  title: Text(
                    "연인",
                    style: TextStyle(color: color202020),
                  ),
                  onTap: () {
                    _visitingWithwhoController.text = "연인";
                    Get.back();
                  },
                ),
                ListTile(
                  title: Text(
                    "가족",
                    style: TextStyle(color: color202020),
                  ),
                  onTap: () {
                    _visitingWithwhoController.text = "가족";
                    Get.back();
                  },
                ),
                ListTile(
                  title: Text(
                    "친구",
                    style: TextStyle(color: color202020),
                  ),
                  onTap: () {
                    _visitingWithwhoController.text = "친구";
                    Get.back();
                  },
                ),
                ListTile(
                  title: Text(
                    "회식",
                    style: TextStyle(color: color202020),
                  ),
                  onTap: () {
                    _visitingWithwhoController.text = "회식";
                    Get.back();
                  },
                ),
                ListTile(
                  title: Text(
                    "소개팅",
                    style: TextStyle(color: color202020),
                  ),
                  onTap: () {
                    _visitingWithwhoController.text = "소개팅";
                    Get.back();
                  },
                ),
                ListTile(
                  title: Text(
                    "회사미팅",
                    style: TextStyle(color: color202020),
                  ),
                  onTap: () {
                    _visitingWithwhoController.text = "회사미팅";
                    Get.back();
                  },
                ),
              ],
            ))),
            Container(
              height: 42,
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: colorD9D9D9),
              ),
              child: GestureDetector(
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "닫기",
                        style: TextStyle(
                          fontFamily: "NotoSans-Bold",
                          fontSize: 16,
                          color: color202020,
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
      );
}

class SectionSwitch extends StatefulWidget {
  final String _title;
  const SectionSwitch(
    this._title, {
    Key key,
  }) : super(key: key);

  @override
  _SectionSwitchState createState() => _SectionSwitchState();
}

class _SectionSwitchState extends State<SectionSwitch> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget._title,
        style: TextStyle(
          fontFamily: "NotoSans-Regular",
          fontSize: 16,
          color: color202020,
        ),
      ),
      trailing: Switch(
        activeColor: colorFFD74A,
        value: checked,
        onChanged: (onValue) {
          setState(() {
            checked = onValue;
          });
        },
      ),
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
    );
  }
}
