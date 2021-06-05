import 'package:flutter/material.dart';
import 'package:mklistui/constants/screen_size.dart';
import 'package:mklistui/widgets/mylist_card.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  static List<String> menu = ['얌얌리스트', '얌얌완료'];
  String _selectedMenu = menu[0];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDropdown(),
              buildCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard() {
    return Padding(
      padding: const EdgeInsets.all(30.0), // 카드 바깥에 패딩
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
