import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:simple_permissions/simple_permissions.dart';

class PhoneContact extends StatefulWidget {
  @override
  _PhoneContactState createState() => _PhoneContactState();
}

class _PhoneContactState extends State<PhoneContact> {
  Permission permission;
  Iterable<Contact> _contacts;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}