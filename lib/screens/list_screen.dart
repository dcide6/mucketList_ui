import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';
import 'package:mklistui/constants/color.dart';
import 'package:mklistui/constants/screen_size.dart';
import 'package:mklistui/models/restaurant.dart';
import 'package:mklistui/models/restaurant_fake_data.dart';
import 'package:mklistui/screens/review_write_screen.dart';
import 'package:mklistui/screens/yamlist_search_screen.dart';
import 'package:mklistui/widgets/home_flexiable_appbar.dart';
import 'package:mklistui/widgets/list_form.dart';
import 'package:mklistui/widgets/mylist_card.dart';
import 'package:mklistui/widgets/random_pick_dialog.dart';
import 'package:mklistui/widgets/search_widget.dart';
import 'package:mklistui/widgets/slidable_widget.dart';

import 'list_add_screen.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  static List<String> menu = ['얌얌리스트', '얌얌완료'];
  List<Restaurant> mylist = [];
  String query = '';
  String currentMenu = menu[0];
  // List items = [
  //   'Orange',
  //   'Grape',
  //   'Carrot',
  //   'Apple',
  //   'Watermelon',
  //   'Orange',
  //   'Grape',
  //   'Carrot',
  //   'Apple',
  //   'Watermelon',
  //   'Watermelon',
  //   'Orange',
  //   'Grape',
  //   'Carrot',
  //   'Apple',
  //   'WatermelonL'
  // ];
  String _selectedMenu = menu[0];
  @override
  void initState() {
    // TODO: implement initState
    mylist = allRestaurants;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: _buildAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0.5,
              expandedHeight: size.height / 2.3,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Positioned.fill(
                        child: Image.asset(
                      "assets/bg2.jpg",
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
              toolbarHeight: 30,
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
            renderSliverList()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: colorFFD74A,
          child: Icon(
            Icons.edit,
          ),
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
              Icon(
                Icons.arrow_drop_down_outlined,
                size: 30,
              ),
            ],
          ),
        ),
      ),
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.filter_alt),
          onPressed: () {},
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
            SlidableWidget(
              child: buildListTile(mylist[index]),
              onDismissed: (action) {
                print(action); //스와이프액션
                return dismissSlidableItem(context, index, action);
              },
            ),
            Divider(
              height: 1,
              color: colorEEEEEE,
            )
          ],
        );
      }, childCount: mylist.length),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: "Search",
        onChanged: searchMyList,
      );

  void searchMyList(String query) {
    final list = allRestaurants.where((list) {
      final titleLower = list.title.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.mylist = list;
    });
  }

  Widget _bodyWidget() {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return SlidableWidget(
          child: buildListTile(mylist[index]),
          onDismissed: (action) {
            print(action); //스와이프액션
            return dismissSlidableItem(context, index, action);
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: colorEEEEEE,
          height: 1,
        );
      },
      itemCount: mylist.length,
    );
  }

  void dismissSlidableItem(
      BuildContext context, int index, SlidableAction action) {
    switch (action) {
      case SlidableAction.comment:
        print(mylist[index]);
        Get.to(() => ReviewWriteScreen(postKey: mylist[index].title));
        break;
      case SlidableAction.delete:
        Get.snackbar("삭제", "완료", snackPosition: SnackPosition.BOTTOM);
    }
  }

  Widget buildListTile(item) {
    return Container(
      child: ListTile(
        onTap: () {
          print(item);
        },
        title: Text(
          item.title,
          style: TextStyle(
            fontFamily: "NotoSans-Regular",
            fontSize: 18,
            color: color202020,
          ),
        ),
        tileColor: Colors.white,
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
                  item.title,
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

  Widget buildCard() {
    return Padding(
      padding: const EdgeInsets.all(32.0), // 카드 바깥에 패딩
      child: Card(
        shadowColor: Colors.grey,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Colors.yellow[200],
        child: Container(
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: MyListCard(
              listDescription: "이 구역 맛집을 아는",
              listGrade: "얌얌박사",
            ),
          ),
        ),
      ),
    );
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
