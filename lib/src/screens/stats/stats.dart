import 'package:flutter/material.dart';
import './swipe_list.dart';

class StatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // appBar: AppBar(title: Text('Stats'),),
      body: SwipeList()
      )
    );
  }
}