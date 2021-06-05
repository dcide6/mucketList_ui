import 'package:flutter/material.dart';
import 'package:mklistui/constants/screen_size.dart';

class MyListCard extends StatelessWidget {
  final String listDescription;
  final String listGrade;

  const MyListCard({
    @required this.listDescription,
    @required this.listGrade,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '리스트 달성률: %',
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          listDescription,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          listGrade,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
