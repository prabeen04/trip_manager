import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/trip.dart';

class TripService {
  Future addTrip(trip) async {
    print(_toJson(trip));
    return FirebaseDatabase.instance
        .reference()
        .child('trips')
        .push()
        .set(_toJson(trip));
  }

  Trip _fromJson(String jsonData) {
    Map<String, dynamic> map = json.decode(jsonData);
    var trip = new Trip();
    trip.name = map['name'];
    trip.startDate = new DateFormat.yMd().parseStrict(map['startDate']);
    trip.endDate = new DateFormat.yMd().parseStrict(map['endDate']);
    trip.location = map['location'];
    trip.budget = map['budget'];
    trip.members = map['members'];
    return trip;
  }

  String _toJson(Trip trip) {
    var mapData = new Map();

    mapData["name"] = trip.name;
    mapData["startDate"] = new DateFormat.yMd().format(trip.startDate);
    mapData["endDate"] = new DateFormat.yMd().format(trip.endDate);
    mapData["location"] = trip.location;
    mapData["budget"] = trip.budget;
    mapData["members"] = trip.members;
    String value = json.encode(mapData);
    return value;
  }
}
