import 'package:flutter/material.dart';
import '../utils/contact/phone_contact.dart';
import '../models/member.dart';

class CreateMember extends StatefulWidget {
  @override
  _CreateMemberState createState() => _CreateMemberState();
}

class _CreateMemberState extends State<CreateMember> {
  Member newMember = new Member();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool isValidEmail(String input) {
    final RegExp regex = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }

  bool isValidPhoneNumber(String input) {
    final RegExp regex = new RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\d\d$');
    return regex.hasMatch(input);
  }

  void _submitForm() {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      showMessage('Form is not valid!  Please review and correct.');
    } else {
      form.save(); //This invokes each onSaved event

      print('Form save called, newMember is now up to date...');
      print('Email: ${newMember.name}');
      print('Phone: ${newMember.phone}');
      print('Email: ${newMember.email}');
      print('========================================');
      print('Submitting to back end...');
      // var MemberService = new MemberService();
      // MemberService.createMember(newMember).then((value) =>
      //     showMessage('New Member created for ${value.name}!', Colors.blue));
    }
  }

  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('Create Member')),
      floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          child: new Icon(Icons.contacts),
          // backgroundColor: new Color(0xFFE57373),
          onPressed: () {
            print(' Fetching contact...');
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => PhoneContact()));
          }),
      body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
              key: _formKey,
              autovalidate: true,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Create Member',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      labelText: 'Name',
                    ),
                    // inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                    validator: (val) => val.isEmpty ? 'Name is required' : null,
                    onSaved: (val) => newMember.name = val,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.phone),
                      labelText: 'Phone',
                    ),
                    keyboardType: TextInputType.phone,
                    // inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                    validator: (val) => val.isEmpty ? 'Name is required' : null,
                    onSaved: (val) => newMember.phone = val,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.email),
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => isValidEmail(value)
                        ? null
                        : 'Please enter a valid email address',
                    onSaved: (val) => newMember.email = val,
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: RaisedButton(
                        color: Colors.blueAccent,
                        child: const Text(
                          'Create Member',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: _submitForm,
                      )),
                ],
              ))),
    );
  }
}
