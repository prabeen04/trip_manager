import 'dart:async';
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import '../models/member.dart';
// final FirebaseDatabase database = FirebaseDatabase.instance;

class MemberService {
  Future<dynamic> createMember(member) async {
    print(_toJson(member));
    FirebaseDatabase.instance
        .reference()
        .child('member')
        .push()
        .set(_toJson(member));
  }
Future<dynamic> fetchMembers() async {
    var data = await FirebaseDatabase.instance.reference().child('member').once();
    print(data);
  }
  Member _fromJson(String jsonData) {
    Map<String, dynamic> map = json.decode(jsonData);
    var member = new Member();
    member.name = map['name'];
    member.phone = map['phone'];
    member.email = map['email'];
    return member;
  }

  String _toJson(Member member) {
    var mapData = new Map();
    mapData["name"] = member.name;
    mapData["phone"] = member.phone;
    mapData["email"] = member.email;
    String value = json.encode(mapData);
    return value;
  }
}
