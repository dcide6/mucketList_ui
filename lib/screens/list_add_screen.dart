import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:mklistui/constants/color.dart';
import 'package:mklistui/constants/screen_size.dart';
import 'package:mklistui/models/sikdang_model.dart';

class ListAddScreen extends StatefulWidget {
  const ListAddScreen({Key key}) : super(key: key);

  @override
  _ListAddScreenState createState() => _ListAddScreenState();
}

class _ListAddScreenState extends State<ListAddScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<TagsState> _foodtagsKey = GlobalKey<TagsState>();
  List _foodtags = [];
  GlobalKey<TagsState> _tagsKey = GlobalKey<TagsState>();
  List _tags = [];
  TextEditingController _restaurantNameController = TextEditingController();
  TextEditingController _foodController = TextEditingController();
  TextEditingController _memoController = TextEditingController();
  TextEditingController _tagContoller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _restaurantNameController.dispose();
    _foodController.dispose();
    _memoController.dispose();
    _tagContoller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '리스트 추가',
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "식당명",
                        style: TextStyle(
                          fontFamily: "NotoSans-Regular",
                          fontSize: 16,
                          color: color696969,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "찾는 식당이 없나요?",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: size.width,
                    child: TypeAheadField<Sikdang>(
                      debounceDuration: Duration(milliseconds: 300),
                      textFieldConfiguration: TextFieldConfiguration(
                          controller: _restaurantNameController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: '식당명을 입력해주세요',
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
                            '찾는 식당이 없어요',
                            style: TextStyle(
                              fontFamily: "NotoSans-Regular",
                              fontSize: 18,
                              color: colorFFD74A,
                            ),
                          ),
                        ),
                      ),
                      onSuggestionSelected: (Sikdang suggestion) {
                        final sikdang = suggestion;
                        print(sikdang.place_name);
                        setState(() {
                          _restaurantNameController.text = sikdang.place_name;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      _restaurantNameController.text,
                      style: TextStyle(
                        fontFamily: "NotoSans-Regular",
                        fontSize: 18,
                        color: color202020,
                      ),
                    ),
                    tileColor: colorFFFFFF,
                    leading: Icon(
                      Icons.food_bank_outlined,
                      size: 35,
                      color: colorFFD74A,
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "카테고리",
                              style: TextStyle(
                                fontFamily: "NotoSans-Regular",
                                fontSize: 14,
                                color: colorD9D9D9,
                              ),
                            ),
                            Text(
                              " | ",
                              style: TextStyle(
                                fontFamily: "NotoSans-Regular",
                                fontSize: 14,
                                color: colorD9D9D9,
                              ),
                            ),
                            Text(
                              "3.2km",
                              style: TextStyle(
                                fontFamily: "NotoSans-Regular",
                                fontSize: 14,
                                color: colorD9D9D9,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "먹고싶은음식",
                    style: TextStyle(
                      fontFamily: "NotoSans-Regular",
                      fontSize: 16,
                      color: color696969,
                    ),
                  ),
                  Container(
                    width: size.width,
                    child: Tags(
                      key: _foodtagsKey,
                      textField: TagsTextField(
                          width: size.width,
                          hintText: "음식을 입력해주세요",
                          textStyle: TextStyle(fontSize: 14),
                          onSubmitted: (string) {
                            setState(() {
                              _foodtags.add(string);
                              print(_foodtags);
                            });
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _foodtags != null
                      ? Tags(
                          heightHorizontalScroll: 36,
                          horizontalScroll: true,
                          itemCount: _foodtags.length,
                          itemBuilder: (index) => ItemTags(
                            index: index,
                            title: _foodtags[index],
                            textActiveColor: color696969,
                            pressEnabled: false,
                            borderRadius: BorderRadius.circular(15),
                            elevation: 0,
                            activeColor: colorD9D9D9,
                            removeButton: ItemTagsRemoveButton(onRemoved: () {
                              setState(() {
                                _foodtags.removeAt(index);
                              });
                              return true;
                            }),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "메모",
                    style: TextStyle(
                      fontFamily: "NotoSans-Regular",
                      fontSize: 16,
                      color: color696969,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextField(
                      textAlign: TextAlign.start,
                      controller: _tagContoller,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(10.0, 70.0, 10.0, 20.0),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "태그",
                    style: TextStyle(
                      fontFamily: "NotoSans-Regular",
                      fontSize: 16,
                      color: color696969,
                    ),
                  ),
                  Container(
                    width: size.width,
                    child: Tags(
                      key: _tagsKey,
                      textField: TagsTextField(
                          width: size.width,
                          hintText: "음식을 입력해주세요",
                          textStyle: TextStyle(fontSize: 14),
                          onSubmitted: (string) {
                            setState(() {
                              _tags.add(string);
                            });
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _tags != null
                      ? Tags(
                          heightHorizontalScroll: 36,
                          horizontalScroll: true,
                          itemCount: _tags.length,
                          itemBuilder: (index) => ItemTags(
                            index: index,
                            title: _tags[index],
                            textActiveColor: color696969,
                            pressEnabled: false,
                            borderRadius: BorderRadius.circular(15),
                            elevation: 0,
                            activeColor: colorD9D9D9,
                            removeButton: ItemTagsRemoveButton(onRemoved: () {
                              setState(() {
                                _tags.removeAt(index);
                              });
                              return true;
                            }),
                          ),
                        )
                      : Container(),
                ],
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
                child: Text('저장'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
