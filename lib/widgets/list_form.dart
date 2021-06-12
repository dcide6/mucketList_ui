import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';

class ListForm extends StatefulWidget {
  @override
  _ListFormState createState() => _ListFormState();
}

class _ListFormState extends State<ListForm> {
  List<String> _tagItems = [
    "approval",
    "pigeon",
    "expenditure",
    "compromise",
    "citizen",
    "inspire",
    "relieve",
    "grave",
    "incredible",
    "invasion",
    "voucher",
    "girl",
    "relax",
    "problem",
    "queue",
    "aviation",
    "profile",
    "palace",
    "drive",
    "money",
    "revolutionary",
    "string",
    "detective",
    "follow",
    "text",
    "bet",
    "decade",
    "means",
    "gossip"
  ];
  TextEditingController _nameController = TextEditingController();
  TextEditingController _foodController = TextEditingController();
  TextEditingController _memoController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("얌얌리스트"),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(child: Text('수정')),
                    PopupMenuItem(child: Text('삭제')),
                    PopupMenuItem(child: Text('공유하기')),
                  ])
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
              title: TextField(
                controller: _nameController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "식당명",
                  border: InputBorder.none,
                ),
              ),
            ),
            _devider(17),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                cursorColor: Colors.black54,
                controller: _foodController,
                decoration: InputDecoration(),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                cursorColor: Colors.black54,
                controller: _memoController,
                decoration: InputDecoration(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Divider _devider(double thickness) {
  return Divider(
    color: Colors.grey[300],
    thickness: thickness,
    height: 1,
  );
}
