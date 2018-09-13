import 'package:flutter/material.dart';

class SwipeList extends StatefulWidget {
  @override
  _SwipeListState createState() => _SwipeListState();
}

class _SwipeListState extends State<SwipeList> {
  List<String> list = new List<String>.generate(30, (i) => 'this is a list');
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(list[index]),
          onDismissed: (direction) {
            list.removeAt(index);
          },
          child: ListTile(title: Text(list[index])),
        );
      },
    );
  }
}
