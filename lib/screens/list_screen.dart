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
  List items = ['Orange', 'Grape', 'Carrot', 'Apple', 'Watermelon'];

  String _selectedMenu = menu[0];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Container(
            height: size.height * 0.5,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildDropdown(),
                buildCard(),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.3,
            maxChildSize: 0.85,
            builder: (BuildContext context, myScrollController) {
              return ClipRRect(
                child: Container(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
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
                    controller: myScrollController,
                  ),
                ),
              );
            },
          )
        ]),
      ),
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

  Padding buildListTile(item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListTile(
        onTap: () {},
        tileColor: Colors.white,
        leading: Text(item),
        subtitle: Text("Tags List"),
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
