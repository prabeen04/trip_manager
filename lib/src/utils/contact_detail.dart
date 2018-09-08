import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class ContactDetail extends StatelessWidget {
  ContactDetail(this._contact);
  final Contact _contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text(_contact.displayName ?? ""), actions: <Widget>[
          FlatButton(
              child: Icon(Icons.delete),
              onPressed: () {
                // ContactsService.deleteContact(_contact);
              })
        ]),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              ListTile(
                  title: Text("Name"),
                  trailing: Text(_contact.givenName ?? "")),
              ListTile(
                  title: Text("Middle name"),
                  trailing: Text(_contact.middleName ?? "")),
              ListTile(
                  title: Text("Family name"),
                  trailing: Text(_contact.familyName ?? "")),
              ListTile(
                  title: Text("Prefix"), trailing: Text(_contact.prefix ?? "")),
              ListTile(
                  title: Text("Suffix"), trailing: Text(_contact.suffix ?? "")),
              ListTile(
                  title: Text("Company"),
                  trailing: Text(_contact.company ?? "")),
              ListTile(
                  title: Text("Job"), trailing: Text(_contact.jobTitle ?? "")),
              // AddressesTile(_contact.postalAddresses),
              ItemsTile("Phones", _contact.phones),
              ItemsTile("Emails", _contact.emails)
            ],
          ),
        ));
  }
}

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


class ItemsTile extends StatelessWidget {
  ItemsTile(this._title, this._items);
  final Iterable<Item> _items;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(title: Text(_title)),
          Column(
              children: _items
                  .map((i) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListTile(
                          title: Text(i.label ?? ""),
                          trailing: Text(i.value ?? ""))))
                  .toList())
        ]);
  }
}
