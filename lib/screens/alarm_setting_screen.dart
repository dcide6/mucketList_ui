import 'package:flutter/material.dart';
import 'package:mklistui/constants/color.dart';

class AlarmSettingScreen extends StatefulWidget {
  const AlarmSettingScreen({Key key}) : super(key: key);

  @override
  _AlarmSettingScreenState createState() => _AlarmSettingScreenState();
}

class _AlarmSettingScreenState extends State<AlarmSettingScreen> {
  var normalAlarm = true; //네트워크 - 일반알람
  var marketingAlarm = true; //네트워크 - 마케팅알람
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("알림 설정"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text(
              '일반 알림',
              style: TextStyle(
                fontFamily: "NotoSans-Regular",
                fontSize: 18,
                color: color202020,
              ),
            ),
            trailing: Switch(
              activeColor: colorFFD74A,
              value: normalAlarm,
              onChanged: (onValue) {
                setState(() {
                  normalAlarm = onValue;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              "공지사항, 소셜 관련 알림을 받아볼 수 있어요",
              style: TextStyle(
                fontFamily: "NotoSans-Regular",
                fontSize: 12,
                color: color696969,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text(
              '마케팅 알림',
              style: TextStyle(
                fontFamily: "NotoSans-Regular",
                fontSize: 18,
                color: color202020,
              ),
            ),
            trailing: Switch(
              activeColor: colorFFD74A,
              value: marketingAlarm,
              onChanged: (onValue) {
                setState(() {
                  marketingAlarm = onValue;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              "이벤트 등의 알림을 받아볼 수 있어요",
              style: TextStyle(
                fontFamily: "NotoSans-Regular",
                fontSize: 12,
                color: color696969,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
