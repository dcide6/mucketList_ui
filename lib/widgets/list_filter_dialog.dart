import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:get/get.dart';
import 'package:mklistui/constants/color.dart';
import 'package:mklistui/constants/screen_size.dart';

Future<Map<String, dynamic>> listFilterDialog(
  BuildContext context,
  Map<String, dynamic> filters,
) async {
  return await showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      String region1 = filters['region1'].toString();
      String region2 = filters['region2'].toString();
      String category = filters['category'].toString();
      String tags = filters['tags'].toString();

      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          GlobalKey<FormState> _formKey = GlobalKey<FormState>();
          TextEditingController _region1Controller = TextEditingController();
          TextEditingController _region2Controller = TextEditingController();
          return SimpleDialog(
            contentPadding: EdgeInsets.all(0),
            insetPadding: EdgeInsets.all(0),
            titlePadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            title: const Center(child: Text('')),
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "지역",
                                style: TextStyle(
                                  fontFamily: "NotoSans-Regular",
                                  fontSize: 16,
                                  color: color696969,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: size.width / 3,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "시/도",
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down_outlined,
                                  ),
                                ),
                                showCursor: true,
                                readOnly: true,
                                controller: _region1Controller,
                                onTap: () {},
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              width: size.width / 3,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "구/군",
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down_outlined,
                                  ),
                                ),
                                showCursor: true,
                                readOnly: true,
                                controller: _region2Controller,
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "카테고리",
                                style: TextStyle(
                                  fontFamily: "NotoSans-Regular",
                                  fontSize: 16,
                                  color: color696969,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              width: size.width / 3,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "All",
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down_outlined,
                                  ),
                                ),
                                showCursor: true,
                                readOnly: true,
                                controller: _region1Controller,
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tag",
                          style: TextStyle(
                            fontFamily: "NotoSans-Regular",
                            fontSize: 16,
                            color: color696969,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "먹고싶은 음식",
                          style: TextStyle(
                            fontFamily: "NotoSans-Regular",
                            fontSize: 16,
                            color: color696969,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "다녀왔얌 노출",
                          style: TextStyle(
                            fontFamily: "NotoSans-Regular",
                            fontSize: 16,
                            color: color696969,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 50,
              ),
              Divider(
                height: 1,
              ),

              // Padding(
              //   padding: EdgeInsets.all(8),
              //   child: TextFormField(
              //     initialValue: region2,
              //     decoration: const InputDecoration(
              //         icon: Icon(Icons.label), labelText: 'region1'),
              //     onChanged: (String value) {
              //       return {
              //         setState(() {
              //           region2 = value;
              //         })
              //       };
              //     },
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.all(8),
              //   child: TextFormField(
              //     initialValue: category,
              //     decoration: const InputDecoration(
              //         icon: Icon(Icons.label), labelText: 'region1'),
              //     onChanged: (String value) {
              //       return {
              //         setState(() {
              //           category = value;
              //         })
              //       };
              //     },
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.all(8),
              //   child: TextFormField(
              //     initialValue: tags,
              //     decoration: const InputDecoration(
              //         icon: Icon(Icons.label), labelText: 'region1'),
              //     onChanged: (String value) {
              //       return {
              //         setState(() {
              //           tags = value;
              //         })
              //       };
              //     },
              //   ),
              // ),
              Container(
                padding: EdgeInsets.all(0),
                height: 50,
                child: GestureDetector(
                  child: Center(child: Text("필터적용")),
                  onTap: () {
                    Navigator.of(context, rootNavigator: true)
                        .pop(<String, dynamic>{
                      'region1': region1,
                      'region2': region2,
                      'category': category,
                      'tags': tags,
                    });
                  },
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
