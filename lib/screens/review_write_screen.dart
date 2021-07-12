import 'dart:io';
import 'package:app_settings/app_settings.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mklistui/constants/color.dart';
import 'package:mklistui/constants/screen_size.dart';
import 'package:mklistui/controllers/yam_list_controller.dart';
import 'package:mklistui/screens/camera_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart' as mimeManager;

class ReviewWriteScreen extends StatefulWidget {
  final File imageFile;
  final int id;

  const ReviewWriteScreen({Key key, @required this.id, this.imageFile})
      : super(key: key);

  @override
  _ReviewWriteScreenState createState() => _ReviewWriteScreenState();
}

class _ReviewWriteScreenState extends State<ReviewWriteScreen> {
  YamListController _yamListController = Get.find<YamListController>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _visitingDateController = TextEditingController();
  TextEditingController _mealTimeController = TextEditingController();
  TextEditingController _companyController = TextEditingController();
  TextEditingController _commentController = TextEditingController();
  bool shared = false;
  String mealTime;
  String company;
  DateTime _selectedDate;
  File _uploadFile;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _visitingDateController.dispose();
    _visitingDateController.dispose();
    _mealTimeController.dispose();
    _companyController.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final index = _yamListController.mylist
        .indexWhere((element) => element.id == widget.id);
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      _yamListController.mylist[index].name,
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      _yamListController.mylist[index].category2depth,
                      style: TextStyle(fontSize: 14, color: color696969),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
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
                      controller: _mealTimeController,
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
                      controller: _companyController,
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
                  controller: _commentController,
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
            // SectionSwitch('공개 여부'),
            ListTile(
              title: Text(
                '공개여부',
                style: TextStyle(
                  fontFamily: "NotoSans-Regular",
                  fontSize: 16,
                  color: color202020,
                ),
              ),
              trailing: Switch(
                activeColor: colorFFD74A,
                value: shared,
                onChanged: (onValue) {
                  setState(() {
                    shared = onValue;
                  });
                },
              ),
            ),
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
                onPressed: () async {
                  ///안돼는부분///
                  String userToken;
                  String url = 'http://yam-stack.com/api/v1/review';
                  var headers = {
                    'Content-Type': 'multipart/form-​data',
                    'x-auth-token': userToken,
                  };
                  var request = http.MultipartRequest('POST', Uri.parse(url));
                  var data = {
                    "comment": "very good",
                    "company": "2",
                    "yam": {"id": "81"},
                    "visitTime": "2021-07-08",
                    "shared": true,
                    "mealTime": "1"
                  };
                  var sendData = json.encode(data);
                  request.fields.addAll({'reviewdata': sendData});
                  print(_uploadFile.path);
                  request.files.add(await http.MultipartFile.fromPath(
                      'image', _uploadFile.path));
                  request.headers.addAll(headers);
                  http.StreamedResponse response = await request.send();
                  print(response.statusCode);
                  if (response.statusCode == 200) {
                    print(await response.stream.bytesToString());
                  } else {
                    print(response.reasonPhrase);
                  }
                  // Options options = Options(
                  //     contentType:
                  //         ContentType.parse('application/json').toString());
                  //
                  // String userToken;
                  // //후기요청 날려본 것인데 포스트맨에서는 되는데 왜 안되는지 모르겠음...
                  // var dioRequest = dio.Dio();
                  //
                  // dioRequest.options.headers['x-auth-token'] =
                  //     'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzMzM4MndhdGVyQGdtYWlsLmNvbSIsInJvbGUiOiJVU0VSIiwiZXhwIjoxNjI2MDYxMDM4fQ.v0mbLLSUlBc9E0SbFI8Bx9qu8kUn6-uwQ1t0o4pjMqI';
                  // dioRequest.options.headers["accept"] = "application/json";
                  //
                  // String url = 'http://yam-stack.com/api/v1/review';
                  // // var yam = {"id": "81"};

                  // print(json.encode(data));
                  // var formData = dio.FormData.fromMap({
                  //   'reviewdata': json.encode(data),
                  //   'image': await dio.MultipartFile.fromFile(_uploadFile.path,
                  //       contentType: MediaType('image',
                  //           mimeManager.lookupMimeType(_uploadFile.path)))
                  // });
                  // print(formData);
                  // var response = await dioRequest.post(url,
                  //     data: formData, options: options);
                  // print(response.statusCode);
                },
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
        print(_uploadFile);
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
        String languageCode = Localizations.localeOf(context).languageCode;
        _selectedDate = pickedDate;
        print(_selectedDate);
        _visitingDateController.text =
            DateFormat.yMMMMEEEEd(languageCode).format(_selectedDate);
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
                  _mealTimeController.text = "아침";
                  mealTime = "0";
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
                setState(() {
                  _mealTimeController.text = "점심";
                  mealTime = "1";
                  Get.back();
                });
              },
            ),
            ListTile(
              title: Text(
                "저녁",
                style: TextStyle(color: color202020),
              ),
              onTap: () {
                setState(() {
                  _mealTimeController.text = "저녁";
                  mealTime = "2";
                  Get.back();
                });
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
                      _companyController.text = "혼자";
                      company = "0";
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
                    setState(() {
                      _companyController.text = "연인";
                      company = "1";
                    });

                    Get.back();
                  },
                ),
                ListTile(
                  title: Text(
                    "가족",
                    style: TextStyle(color: color202020),
                  ),
                  onTap: () {
                    setState(() {
                      _companyController.text = "가족";
                      company = "2";
                    });

                    Get.back();
                  },
                ),
                ListTile(
                  title: Text(
                    "친구",
                    style: TextStyle(color: color202020),
                  ),
                  onTap: () {
                    setState(() {
                      _companyController.text = "친구";
                      company = "3";
                    });

                    Get.back();
                  },
                ),
                ListTile(
                  title: Text(
                    "회식",
                    style: TextStyle(color: color202020),
                  ),
                  onTap: () {
                    setState(() {
                      _companyController.text = "회식";
                      company = "4";
                    });

                    Get.back();
                  },
                ),
                ListTile(
                  title: Text(
                    "소개팅",
                    style: TextStyle(color: color202020),
                  ),
                  onTap: () {
                    setState(() {
                      _companyController.text = "소개팅";
                      company = "5";
                    });

                    Get.back();
                  },
                ),
                ListTile(
                  title: Text(
                    "회사미팅",
                    style: TextStyle(color: color202020),
                  ),
                  onTap: () {
                    setState(() {
                      _companyController.text = "회사미팅";
                      company = "6";
                    });

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
