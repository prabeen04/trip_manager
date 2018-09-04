import 'package:flutter/material.dart';

import './src/screens/feed.dart';
import './src/screens/trips.dart';
import './src/screens/members.dart';
import './src/screens/stats.dart';
import './src/screens/settings.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    FeedScreen(),
    TripsScreen(),
    MembersScreen(),
    StatsScreen(),
    SettingsScreen()
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //   child: ListView(
      //     // Important: Remove any padding from the ListView.
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       UserAccountsDrawerHeader(
      //           currentAccountPicture: new CircleAvatar(
      //             backgroundImage: new NetworkImage('https://i.ytimg.com/vi/xwa1cBWWCVY/hqdefault.jpg'),
      //           ),
      //           accountName: Text(
      //             "Prabeen",
      //             style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
      //           ),
      //           accountEmail: Text(
      //             "prabeen.strange@gmail.com",
      //             style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
      //           )),
      //       ListTile(
      //         title: Text('Profile'),
      //         trailing: Icon(Icons.person),
      //         onTap: () {
      //           // Update the state of the app
      //           // ...
      //           // Then close the drawer
      //           Navigator.pop(context);
      //           Navigator.of(context).push(MaterialPageRoute(
      //               builder: (BuildContext context) => ProfileScreen()));
      //         },
      //       ),
      //       ListTile(
      //         title: Text('News'),
      //         trailing: Icon(Icons.explore),
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.of(context).push(MaterialPageRoute(
      //               builder: (BuildContext context) => NewsScreen()));
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Form'),
      //         trailing: Icon(Icons.edit),
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.of(context).push(MaterialPageRoute(
      //               builder: (BuildContext context) => FormScreen()));
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: _children[_currentIndex], // new
      // Bottom Navigator Starts here!!

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex, // this will be set when a tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed),
            title: Text('FEEDS'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trip_origin),
            title: Text('TRIPS'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_work),
            title: Text('MEMBERS'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            title: Text('STATS'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
               title: Text('Settings'
               ))
        ],
      ),
    );
  }
}