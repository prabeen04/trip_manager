import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../models/member.dart';

class MemberService{
  Future createMember(member) async{
    return await Firestore.instance.collection('members/member').add(member);    
  }
  String _toJson(Member contact) {
    var mapData = new Map();
    mapData["name"] = contact.name;
    mapData["dob"] = new DateFormat.yMd().format(contact.dob);
    mapData["phone"] = contact.phone;
    mapData["email"] = contact.email;
    mapData["favoriteColor"] = contact.favoriteColor;
    String json = json.encode(mapData);
    return json;
  }
}