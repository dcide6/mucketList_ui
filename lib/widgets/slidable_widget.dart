import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mklistui/constants/color.dart';

enum SlidableAction { comment, delete }

class SlidableWidget<T> extends StatelessWidget {
  final Widget child;
  final Function(SlidableAction action) onDismissed;
  const SlidableWidget(
      {Key key, @required this.child, @required this.onDismissed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: child,
      actionExtentRatio: 0.25,
      actionPane: SlidableDrawerActionPane(),
      actions: [
        IconSlideAction(
          caption: '후기얌',
          color: colorFFD74A,
          onTap: () {
            return onDismissed(SlidableAction.comment);
          },
        ),
      ],
      secondaryActions: [
        IconSlideAction(
          caption: '별로얌',
          color: colorFF3535,
          onTap: () {
            return onDismissed(SlidableAction.delete);
          },
        ),
      ],
    );
  }
}
