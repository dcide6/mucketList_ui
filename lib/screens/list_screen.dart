import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mklistui/constants/screen_size.dart';
import 'package:mklistui/widgets/mylist_card.dart';
import 'package:mklistui/widgets/slidable_widget.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  static List<String> menu = ['얌얌리스트', '얌얌완료'];
  String currentMenu = menu[0];
  List items = [
    'Orange',
    'Grape',
    'Carrot',
    'Apple',
    'Watermelon',
    'Orange',
    'Grape',
    'Carrot',
    'Apple',
    'Watermelon',
    'Watermelon',
    'Orange',
    'Grape',
    'Carrot',
    'Apple',
    'WatermelonL'
  ];

  String _selectedMenu = menu[0];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _bodyWidget(),
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
              Text(currentMenu),
              Icon(
                Icons.arrow_drop_down_outlined,
                size: 30,
              ),
            ],
          ),
        ),
      ),
      elevation: 1,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        )
      ],
    );
  }

  Widget _bodyWidget() {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return SlidableWidget(
          child: buildListTile(items[index]),
          onDismissed: (action) {
            print(action); //스와이프액션
            return dismissSlidableItem(context, index, action);
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey,
          height: 0,
        );
      },
      itemCount: items.length,
    );
  }

  void dismissSlidableItem(
      BuildContext context, int index, SlidableAction action) {
    setState(() {
      items.removeAt(index);
    });
    switch (action) {
      case SlidableAction.comment:
        //후기작성스크린
        break;
      case SlidableAction.delete:
        Get.snackbar("삭제", "완료", snackPosition: SnackPosition.BOTTOM);
    }
  }

  Widget buildListTile(item) {
    return Container(
      child: ListTile(
        onTap: () {},
        tileColor: Colors.white,
        leading: Icon(Icons.circle),
        subtitle: Text(item),
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
          borderRadius: BorderRadius.circular(32),
        ),
        color: Colors.yellow[200],
        child: Container(
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
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
