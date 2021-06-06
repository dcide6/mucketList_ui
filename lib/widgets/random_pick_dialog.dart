import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RandomPickDialog extends StatelessWidget {
  final String pickedList;
  final String pickedListInfo;

  const RandomPickDialog(
      {Key key, @required this.pickedList, @required this.pickedListInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      backgroundColor: Colors.yellow[100],
      child: Container(
        margin: EdgeInsets.all(5.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 22.0,
            ),
            Text("추천이얌"),
            SizedBox(
              height: 22.0,
            ),
            Divider(
              height: 2.0,
              thickness: 2.0,
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "$pickedList",
              style: TextStyle(fontSize: 55.0, fontFamily: "Brand Bold"),
            ),
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "$pickedListInfo",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: RaisedButton(
                onPressed: () async {
                  Get.back();
                },
                color: Colors.yellow[200],
                child: Padding(
                  padding: EdgeInsets.all(17.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("선택",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
