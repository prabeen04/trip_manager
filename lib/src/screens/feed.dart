import 'package:flutter/material.dart';
import '../widgets/fancy_fab.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // appBar: AppBar(title: Text('Feed'),),
      body: Center(
        child: Text('Feed Screen'),
      ),
      floatingActionButton:
            FancyFab() // This trailing comma makes auto-formatting nicer for build methods.
        )
      )
    );
  }
}