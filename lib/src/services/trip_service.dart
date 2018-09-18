import 'dart:async';
import 'dart:convert';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/trip.dart';

class TripService {
  Future addTrip(trip) async {
    return FirebaseDatabase.instance
        .reference()
        .push()
        .child('trips')
        .set(_toJson(trip));
    // return await Firestore.instance.collection('trips').add(trip);
  }

  Trip _fromJson(String jsonData) {
    Map<String, dynamic> map = json.decode(jsonData);
    var trip = new Trip();
    trip.name = map['name'];
    trip.startDate = map['startDate'];
    trip.endDate = map['endDate'];
    trip.location = map['location'];
    trip.budget = map['budget'];
    trip.members = map['members'];
    return trip;
  }

  String _toJson(Trip trip) {
    var mapData = new Map();
    mapData["name"] = trip.name;
    mapData["startDate"] = trip.startDate;
    mapData["endDate"] = trip.endDate;
    mapData["location"] = trip.location;
    mapData["budget"] = trip.budget;
    mapData["members"] = trip.members;
    String value = json.encode(mapData);
    return value;
  }
}
