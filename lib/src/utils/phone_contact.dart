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
  initState() {
    super.initState();
    checkPermission();
  }

  requestPermission() async {
    bool res =
        await SimplePermissions.requestPermission(Permission.ReadContacts);
    print("permission request result is " + res.toString());
    checkPermission();
  }

  checkPermission() async {
    print('Inside checkPermission()');
    bool res = await SimplePermissions.checkPermission(Permission.ReadContacts);
    print(res);
    if (res == true) {
      debugPrint('Permission granted');
      refreshContacts();
    } else {
      debugPrint('No Permission');
      requestPermission();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
