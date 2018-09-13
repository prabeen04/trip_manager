import 'package:flutter/material.dart';

class SwipeList extends StatefulWidget {
  @override
  _SwipeListState createState() => _SwipeListState();
}

class _SwipeListState extends State<SwipeList> {
  List<String> list = new List.generate(30, (int index) => 'this is a list');
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: list.length,
      )
    );
  }
}