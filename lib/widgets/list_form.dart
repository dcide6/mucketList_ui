import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mklistui/models/sikdang_model.dart';

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
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(onPressed: () {}, child: Text("찾는 식당이 없나요?")),
                  TypeAheadField<Sikdang>(
                    debounceDuration: Duration(milliseconds: 500),
                    textFieldConfiguration: TextFieldConfiguration(
                        decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      hintText: '식당 검색',
                    )),
                    suggestionsCallback: SikdangApi.getSikdangSuggestions,
                    itemBuilder: (context, suggestion) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(suggestion.place_name),
                          ),
                        ],
                      );
                    },
                    noItemsFoundBuilder: (context) => Container(
                      height: 100,
                      child: Center(
                        child: Text(
                          '식당이 없어요',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    onSuggestionSelected: (Sikdang suggestion) {
                      final sikdang = suggestion;
                      print(sikdang.place_name);
                    },
                  ),
                ],
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
