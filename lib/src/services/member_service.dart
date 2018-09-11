import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/member.dart';

class MemberService {
  Future<DocumentReference> createMember(member) async {
    Map<String, dynamic> val = _toJson(member);
    var val2 = json.encode(val);
    print(val2)
    DocumentReference data =
        await Firestore.instance.collection('members').add(val);
    return data;
  }

  Member _fromJson(String jsonData) {
    Map<String, dynamic> map = json.decode(jsonData);
    var member = new Member();
    member.name = map['name'];
    member.phone = map['phone'];
    member.email = map['email'];
    return member;
  }

  Map<String, dynamic> _toJson(Member member) {
    var mapData = new Map();
    mapData["name"] = member.name;
    mapData["phone"] = member.phone;
    mapData["email"] = member.email;
    // String value = json.encode(mapData);
    return mapData;
  }
}
