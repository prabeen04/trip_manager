import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import '../models/trip.dart';
import '../services/trip_service.dart';
class CreateTrip extends StatefulWidget {
  @override
  _CreateTripState createState() => _CreateTripState();
}

class _CreateTripState extends State<CreateTrip> {
  String _member = '';
  List<String> _members = <String>['','Paul Pogba', 'Romelu Lukaku', 'Marcus Rashford', 'Anthony Martial', 'Jesse Lingard'];
  Trip newTrip = new Trip();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _controller = new TextEditingController();

  Future _chooseDate(BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
    initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now)
        ? initialDate
        : now);

    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now());

    if (result == null) return;

    setState(() {
      _controller.text = new DateFormat.yMd().format(result);
    });
  }

  DateTime convertToDate(String input) {
    try {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }

  bool isValidDob(String dob) {
    if (dob.isEmpty) return true;
    var d = convertToDate(dob);
    return d != null && d.isBefore(new DateTime.now());
  }

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

      print('Form save called, newTrip is now up to date...');
      print('Name: ${newTrip.name}');
      print('Start Date: ${newTrip.startDate}');
      print('End Date: ${newTrip.endDate}');
      print('Location: ${newTrip.location}');
      print('Budgets: ${newTrip.budget}');
      print('Members: ${newTrip.members}');
      print('========================================');
      print('Submitting to back end...');
      var tripService = TripService();
      tripService.addTrip(newTrip).then((value) =>
          print('New Trip created for'));
    }
  }

  void showMessage(String message) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(backgroundColor: Colors.red, content: new Text('Trip added')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('Create Trip')),
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
                      'Create Trip',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      labelText: 'Trip Name',
                    ),
                    // inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                    validator: (val) =>
                        val.isEmpty ? 'Trip name is required' : null,
                    onSaved: (val) => newTrip.name = val,
                  ),
                  Row(children: <Widget>[
                    new Expanded(
                        child: new TextFormField(
                      decoration: new InputDecoration(
                        icon: const Icon(Icons.calendar_today),
                        labelText: 'Start Date',
                      ),
                      controller: _controller,
                      keyboardType: TextInputType.datetime,
                      validator: (val) =>
                          isValidDob(val) ? null : 'Not a valid date',
                      onSaved: (val) => newTrip.startDate = convertToDate(val),
                    )),
                    new IconButton(
                      icon: new Icon(Icons.more_horiz),
                      tooltip: 'Choose date',
                      onPressed: (() {
                        _chooseDate(context, _controller.text);
                      }),
                    )
                  ]),
                  Row(children: <Widget>[
                    new Expanded(
                        child: new TextFormField(
                      decoration: new InputDecoration(
                        icon: const Icon(Icons.calendar_today),
                        labelText: 'End Date',
                      ),
                      controller: _controller,
                      keyboardType: TextInputType.datetime,
                      validator: (val) =>
                          isValidDob(val) ? null : 'Not a valid date',
                      onSaved: (val) => newTrip.endDate = convertToDate(val),
                    )),
                    new IconButton(
                      icon: new Icon(Icons.more_horiz),
                      tooltip: 'Choose date',
                      onPressed: (() {
                        _chooseDate(context, _controller.text);
                      }),
                    )
                  ]),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.location_city),
                      labelText: 'Location',
                    ),
                    keyboardType: TextInputType.text,
                    // inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                    validator: (val) =>
                        val.isEmpty ? 'Location is required' : null,
                    onSaved: (val) => newTrip.location = val,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.money_off),
                      labelText: 'Budget',
                    ),
                    keyboardType: TextInputType.number,
                    // validator: (val) =>
                    //     val.isEmpty ? 'Budget is required' : null,
                    onSaved: (val) => newTrip.budget = val,
                  ),
                  InputDecorator(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.color_lens),
                      labelText: 'Members',
                    ),
                    isEmpty: _member == '',
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _member,
                        isDense: true,
                        onChanged: (String newValue) {
                          setState(() {
                            newTrip.members = newValue;
                            _member = newValue;
                          });
                        },
                        items: _members.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: RaisedButton(
                        color: Colors.blueAccent,
                        child: const Text(
                          'Create Trip',
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
