import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class MemberService{
  Future createMember(member) async{
    return await Firestore.instance.collection('members').add(member);    
  }
}