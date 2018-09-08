
import 'package:flutter/material.dart';

class ItemsTile extends StatelessWidget {
  ItemsTile(this._title, this._items);
  final Iterable _items;
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
