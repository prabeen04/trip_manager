import 'package:flutter/material.dart';
import './create_member.dart';

class MembersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // appBar: AppBar(title: Text('Members'),),
        body: Center(
          child: Text('Members Screen'),
        ),
        floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            child: new Icon(Icons.add),
            // backgroundColor: new Color(0xFFE57373),
            onPressed: () {
              print(' Add Member button');
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => CreateMember()));
            }),
      ),
    );
  }
}
