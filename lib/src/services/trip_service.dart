import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/trip.dart';

class TripService {
  Future<DocumentReference> addTrip(trip) async {
    return await Firestore.instance.collection('trip').add(trip);
  }
}
