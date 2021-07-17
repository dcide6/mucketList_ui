import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:mklistui/constants/color.dart';
import 'package:mklistui/constants/screen_size.dart';
import 'package:mklistui/controllers/yam_list_controller.dart';
import 'package:mklistui/models/kakao_list_model.dart';
import 'package:dio/dio.dart';
import 'package:mklistui/models/yam_list_model.dart';

class ListAddScreen extends StatefulWidget {
  const ListAddScreen({Key key}) : super(key: key);

  @override
  _ListAddScreenState createState() => _ListAddScreenState();
}

class _ListAddScreenState extends State<ListAddScreen> {
  YamListController _yamListController = Get.find<YamListController>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List _foodtags = [];
  List _tags = [];
  TextEditingController _restaurantNameController = TextEditingController();
  TextEditingController _memoController = TextEditingController();

  String _place_name;
  String _id;
  String _category_name;
  String _category_group_code;
  String _category_group_name;
  String _phone;
  String _address_name;
  String _road_address_name;
  String _x;
  String _y;
  String _place_url;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _restaurantNameController.dispose();
    _memoController.dispose();
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
                    child: TypeAheadField<KakaoListModel>(
                      debounceDuration: Duration(milliseconds: 100),
                      textFieldConfiguration: TextFieldConfiguration(
                          controller: _restaurantNameController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: '식당명을 입력해주세요',
                          )),
                      suggestionsCallback:
                          KakaoListModelApi.getKakaoListModelSuggestions,
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
                              color: color202020,
                            ),
                          ),
                        ),
                      ),
                      onSuggestionSelected: (KakaoListModel suggestion) {
                        final chosenList = suggestion;
                        _place_name = chosenList.place_name;
                        _id = chosenList.id;
                        _category_name = chosenList.category_name;
                        _category_group_code = chosenList.category_group_code;
                        _category_group_name = chosenList.category_group_name;
                        _phone = chosenList.phone;
                        _address_name = chosenList.address_name;
                        _road_address_name = chosenList.road_address_name;
                        _x = chosenList.x;
                        _y = chosenList.y;
                        _place_url = chosenList.place_url;
                        // print(chosenList.place_name);
                        // print(chosenList.id);
                        // print(chosenList.category_name);
                        // print(chosenList.category_group_code);
                        // print(chosenList.category_group_name);
                        // print(chosenList.phone);
                        // print(chosenList.address_name);
                        // print(chosenList.road_address_name);
                        // print(chosenList.x);
                        // print(chosenList.y);
                        // print(chosenList.place_url);
                        setState(() {
                          _restaurantNameController.text =
                              chosenList.place_name;
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
                    leading: SvgPicture.asset("assets/icons/카테고리 이미지.svg"),
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
                      textField: TagsTextField(
                          autofocus: false,
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
                      controller: _memoController,
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
                      textField: TagsTextField(
                          autofocus: false,
                          width: size.width,
                          hintText: "태그를 입력해주세요",
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
                onPressed: () async {
                  String userToken =
                      'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzMzM4MndhdGVyQGdtYWlsLmNvbSIsInJvbGUiOiJVU0VSIiwidHlwZSI6ImFjY2VzcyIsImV4cCI6MTYyNjU0MDA3Mn0.jHsAE5wKsLODdwluJIrWSl99J4M5EaTNNXePvi6F4nE';
                  Dio dio = new Dio();
                  dio.options.headers['content-Type'] = 'application/json';
                  dio.options.headers['x-auth-token'] = userToken;
                  String url = 'http://yam-stack.com/api/v1/restaurant';
                  var response = await dio.post(
                    url,
                    data: {
                      "address_name": _address_name,
                      "category_group_code": _category_group_code,
                      "category_group_name": _category_group_name,
                      "category_name": _category_name,
                      "id": _id,
                      "phone": _phone,
                      "place_name": _restaurantNameController.text,
                      "place_url": _place_url,
                      "road_address_name": _road_address_name,
                      "x": _x,
                      "y": _y,
                      "foods": _foodtags,
                      "tags": _tags,
                      "memo": _memoController.text,
                    },
                  );
                  print(response.statusCode);
                  if (response.statusCode == 200) {
                    _yamListController.mylist.add(YamListModel(
                        id: response.data["id"],
                        name: response.data["name"],
                        region1depth: response.data["region1depth"],
                        region2depth: response.data["region2depth"],
                        region3depth: response.data["region3depth"],
                        x: response.data["x"],
                        y: response.data["y"],
                        category2depth: response.data["category1depth"],
                        foods: _foodtags,
                        tags: _tags,
                        memo: _memoController.text));
                    Get.back();
                  }
                },
                child: Text('저장'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
