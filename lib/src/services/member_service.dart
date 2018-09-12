import 'dart:async';
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import '../models/member.dart';
final FirebaseDatabase database = FirebaseDatabase.instance;

class MemberService {
  Future<dynamic> createMember(member) async {
    print( _toJson(member));
    database.reference().child('member').set( {
      "name": "prabeen",
      "phone": "9438718954",
      "email": "prabeen.strange@gmail.com",
    });
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
