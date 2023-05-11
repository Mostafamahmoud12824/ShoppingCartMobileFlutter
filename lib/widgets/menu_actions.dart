import 'package:flutter/material.dart';

class MainMenuActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('Option 1'),
          leading: Icon(Icons.settings),
          onTap: () {},
        ),
        ListTile(
          title: Text('Option 2'),
          leading: Icon(Icons.search),
          onTap: () {},
        ),
        ListTile(
          title: Text('Option 3'),
          leading: Icon(Icons.logout),
          onTap: () {},
        ),
      ],
    );
  }
}
