import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('Settings'),),
      body: Center(
        child: Text('Settings Screen'),
      ),
      )
    );
  }
}