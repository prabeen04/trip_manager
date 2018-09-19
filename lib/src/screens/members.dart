import 'package:flutter/material.dart';
import '../services/member_service.dart';
import './create_member.dart';

class MembersScreen extends StatefulWidget {
  @override
  MembersScreenState createState() {
    return new MembersScreenState();
  }
}

class MembersScreenState extends State<MembersScreen> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    var memberService = new MemberService();
    memberService.fetchMembers().then((snapshot){
      print(snapshot);
    });
  }

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
