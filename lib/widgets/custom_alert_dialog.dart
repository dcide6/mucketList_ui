import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mklistui/constants/color.dart';
import 'package:mklistui/constants/screen_size.dart';

class CustomAlertDialog extends StatefulWidget {
  final Function chooseReason;
  final String title;

  const CustomAlertDialog({Key key, this.title, this.chooseReason})
      : super(key: key);
  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
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
            "${widget.title}",
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
                      "방문의사없음",
                      style: TextStyle(
                        fontFamily: "NotoSans-Regular",
                        fontSize: 14,
                        color: color696969,
                      ),
                    ),
                  ),
                  onTap: () {
                    widget.chooseReason("방문의사없음");
                    Get.back();
                  },
                ),
                VerticalDivider(
                  width: 1,
                ),
                InkWell(
                  child: Center(
                    child: Text(
                      "       폐업       ",
                      style: TextStyle(
                        fontFamily: "NotoSans-Regular",
                        fontSize: 14,
                        color: color696969,
                      ),
                    ),
                  ),
                  onTap: () {
                    widget.chooseReason("폐업");
                    Get.back();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
