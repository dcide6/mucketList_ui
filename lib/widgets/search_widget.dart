import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mklistui/constants/color.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;
  final Function searchBarOn;

  const SearchWidget(
      {Key key, this.text, this.onChanged, this.hintText, this.searchBarOn})
      : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: color696969);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: 42,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: colorD9D9D9),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        showCursor: false,
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(
            Icons.search,
            color: color696969,
          ),
          suffixIcon: GestureDetector(
            child: Icon(Icons.close),
            onTap: () {
              controller.clear();
              widget.onChanged('');
              widget.searchBarOn();
              FocusScope.of(context).requestFocus(FocusNode());
            },
          ),
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}
