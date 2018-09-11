import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/member.dart';

class MemberService {
  Future<DocumentReference> createMember(member) async {
    print( _toJson(member));
    return await Firestore.instance.collection('members').add(member);
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
