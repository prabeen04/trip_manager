import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/member.dart';

class MemberService{
  Future createMember(member) async{
          String val = _toJson(member);

    return await Firestore.instance.collection('members').add(val);    
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