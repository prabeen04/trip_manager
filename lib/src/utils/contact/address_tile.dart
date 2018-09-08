import 'package:flutter/material.dart';

class AddressesTile extends StatelessWidget {
  AddressesTile(this._addresses);
  final Iterable<PostalAddress> _addresses;

  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(title: Text("Addresses")),
          Column(
              children: _addresses
                  .map((a) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                                title: Text("Street"),
                                trailing: Text(a.street)),
                            ListTile(
                                title: Text("Postcode"),
                                trailing: Text(a.postcode)),
                            ListTile(
                                title: Text("City"), trailing: Text(a.city)),
                            ListTile(
                                title: Text("Region"),
                                trailing: Text(a.region)),
                            ListTile(
                                title: Text("Country"),
                                trailing: Text(a.country)),
                          ],
                        ),
                      ))
                  .toList())
        ]);
  }
}
