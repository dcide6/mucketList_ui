import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mklistui/constants/color.dart';
import 'package:mklistui/controllers/yam_list_controller.dart';

class DeletedListScreen extends StatefulWidget {
  const DeletedListScreen({Key key}) : super(key: key);

  @override
  _DeletedListScreenState createState() => _DeletedListScreenState();
}

class _DeletedListScreenState extends State<DeletedListScreen> {
  YamListController _yamListController = Get.put(YamListController());
  //추후 모드변경으로 삭제 리스트만 가져올 예정입니다
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("삭제 리스트"),
        ),
        body: ListView.separated(
            itemCount: _yamListController.mylist.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(height: 1, color: color696969);
            },
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  _yamListController.mylist[index].name,
                  style: TextStyle(
                    fontFamily: "NotoSans-Regular",
                    fontSize: 18,
                    color: color202020,
                  ),
                ),
                tileColor: Colors.white,
                leading: foodsIconReturn(
                    _yamListController.mylist[index].category2depth),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          _yamListController.mylist[index].region1depth,
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
                    Row(
                      children: [
                        Text(
                          "#계절과일 ",
                          style: TextStyle(
                            fontFamily: "NotoSans-Regular",
                            fontSize: 14,
                            color: color696969,
                          ),
                        ),
                        Text(
                          "#배달쌉가능 ",
                          style: TextStyle(
                            fontFamily: "NotoSans-Regular",
                            fontSize: 14,
                            color: color696969,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.warning,
                      size: 20,
                      color: colorFFD74A,
                    ),
                  ],
                ),
              );
            }));
  }

  SvgPicture foodsIconReturn(String category) {
    switch (category) {
      case "디저트":
        return SvgPicture.asset("assets/images/foods/디저트.svg");
      case "분식":
        return SvgPicture.asset("assets/images/foods/분식.svg");
      case "술집":
        return SvgPicture.asset("assets/images/foods/술집.svg");
      case "아시아음식":
        return SvgPicture.asset("assets/images/foods/아시아음식.svg");
      case "양식":
        return SvgPicture.asset("assets/images/foods/양식.svg");
      case "일식":
        return SvgPicture.asset("assets/images/foods/일식.svg");
      case "중식":
        return SvgPicture.asset("assets/images/foods/중식.svg");
      case "치킨":
        return SvgPicture.asset("assets/images/foods/치킨.svg");
      case "카페":
        return SvgPicture.asset("assets/images/foods/카페.svg");
      case "한식":
        return SvgPicture.asset("assets/images/foods/한식.svg");
      default:
        return SvgPicture.asset("assets/images/foods/기타.svg");
    }
  }
}
