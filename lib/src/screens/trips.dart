import 'package:flutter/material.dart';
import '../services/trip_service.dart';
import './create_trip.dart';

class TripsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // appBar: AppBar(title: Text('Trips'),),
        body: Center(
          child: Text('Trips Screen'),
        ),
        floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            child: new Icon(Icons.add),
            // backgroundColor: new Color(0xFFE57373),
            onPressed: () {
              print('trip button');
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => CreateTrip()));
            }),
      ),
    );
  }
}
