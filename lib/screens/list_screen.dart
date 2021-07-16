import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mklistui/constants/color.dart';
import 'package:mklistui/constants/screen_size.dart';
import 'package:mklistui/controllers/yam_list_controller.dart';
import 'package:mklistui/models/yam_list_model.dart';
import 'package:mklistui/screens/review_write_screen.dart';
import 'package:mklistui/widgets/custom_alert_dialog.dart';
import 'package:mklistui/widgets/home_flexiable_appbar.dart';
import 'package:mklistui/widgets/list_filter_dialog.dart';
import 'package:mklistui/widgets/list_form.dart';
import 'package:mklistui/widgets/random_pick_dialog.dart';
import 'package:mklistui/widgets/search_widget.dart';
import 'list_add_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final YamListController _yamListController = Get.put(YamListController());
  List showList = [];
  static List<String> menu = ['얌얌리스트', '얌얌완료'];
  bool searchBarOpened = false;
  String query = '';
  String currentMenu = menu[0];
  String _selectedMenu = menu[0];
  @override
  void initState() {
    // TODO: implement initState
    showList = _yamListController.mylist;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: _buildAppBar(),
        body: CustomScrollView(
          slivers: [
            searchBarOpened
                ? SliverPadding(padding: EdgeInsets.all(0))
                : SliverAppBar(
                    elevation: 0.5,
                    expandedHeight: size.height / 2.3,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        children: [
                          Positioned.fill(
                              child: Image.asset(
                            "assets/images/bg2_fixed.jpg",
                            fit: BoxFit.cover,
                          )),
                          HomeFlexibleAppBar(),
                        ],
                      ),
                    ),
                  ),
            SliverAppBar(
              toolbarHeight: 15,
              primary: false,
              floating: false,
              pinned: true,
              brightness: Brightness.light,
              elevation: 0.0,
              flexibleSpace: Container(
                decoration: BoxDecoration(color: Colors.white),
              ),
            ),
            SliverAppBar(
              toolbarHeight: 50,
              elevation: 0.5,
              pinned: true,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                title: _buildAppBar(),
                titlePadding: EdgeInsets.all(0.0),
              ),
            ),
            SliverAppBar(
              toolbarHeight: 70,
              primary: true,
              pinned: true,
              brightness: Brightness.light,
              elevation: 0.0,
              flexibleSpace: buildSearch(),
            ),
            // buildSearch(),
            Obx(() => renderSliverList()),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: colorFFD74A,
          child: SvgPicture.asset("assets/icons/FB.svg"),
          onPressed: () {
            Get.to(() => ListAddScreen());
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: GestureDetector(
        onTap: () {},
        child: PopupMenuButton(
          offset: Offset(0, 25),
          shape: ShapeBorder.lerp(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              1),
          onSelected: (menu) {
            setState(() {
              currentMenu = menu;
            });
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(value: menu[0], child: Text(menu[0])),
              PopupMenuItem<String>(value: menu[1], child: Text(menu[1])),
            ];
          },
          child: Row(
            children: [
              Text(
                currentMenu,
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                width: 10,
              ),
              SvgPicture.asset("assets/icons/Dropdown.svg"),
            ],
          ),
        ),
      ),
      elevation: 0,
      actions: [
        IconButton(
          icon: SvgPicture.asset("assets/icons/Filter icon N.svg"),
          onPressed: () {
            listFilterDialog(context, {
              'region1': '서울시',
              'region2': '동작구',
              'category': '양식',
              'tags': '맛있는'
            }).then((Map<String, dynamic> filters) {
              setState(() {
                print(filters['category']);
              });
            });
          },
        ),
      ],
    );
  }

  renderSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            Divider(
              height: 1,
            ),
            buildListTile(showList[index], index),
            Divider(
              height: 1,
              color: colorEEEEEE,
            )
          ],
        );
      }, childCount: showList.length),
    );
  }

  Widget buildSearch() {
    searchBarOpened = true;
    void searchBarOn() {
      searchBarOpened = false;
    }

    return SearchWidget(
      text: query,
      hintText: "Search",
      onChanged: searchMyList,
      searchBarOn: searchBarOn,
    );
  }

  void searchMyList(String query) {
    final searchList = _yamListController.mylist.where((list) {
      final titleLower = list.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.showList = searchList;
    });
  }

  Widget buildListTile(item, index) {
    return Container(
      child: ListTile(
        onTap: () {
          print(item.id);
          Get.to(() => ReviewWriteScreen(id: item.id));
        },
        title: Text(
          item.name,
          style: TextStyle(
            fontFamily: "NotoSans-Regular",
            fontSize: 18,
            color: color202020,
          ),
        ),
        tileColor: Colors.white,
        leading: foodsIconReturn(item.category2depth),
        subtitle: Column(
          children: [
            Row(
              children: [
                Text(
                  item.region1depth,
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
      ),
    );
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

  Widget buildDropdown() {
    return Container(
      width: size.width / 7 * 3,
      margin: EdgeInsets.fromLTRB(30, 30, 10, 20),
      child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
        elevation: 0,
        autofocus: true,
        value: _selectedMenu,
        items: menu
            .map((item) => DropdownMenuItem<String>(
                  child: Container(
                    child: Text(
                      item,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  value: item,
                  onTap: () {
                    print(item);
                  },
                ))
            .toList(),
        onChanged: (newValue) {
          setState(() {
            this._selectedMenu = newValue;
            if (menu.indexOf(newValue) == 1) {
              menu = new List.from(menu.reversed);
            }
          });
        },
      )),
    );
  }
}
