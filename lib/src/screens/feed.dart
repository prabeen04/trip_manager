import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/fancy_fab.dart';

class FeedScreen extends StatefulWidget {
  @override
  FeedScreenState createState() {
    return new FeedScreenState();
  }
}

class FeedScreenState extends State<FeedScreen> {
  final DocumentReference documentReference = Firestore.instance.collection('trips').document('trip1');
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
      );
  }
}