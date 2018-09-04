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
      appBar: AppBar(
          title: Text('Home'),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(
                Icons.notifications,
                color: Colors.black38,
              ),
              tooltip: 'Notifications',
              onPressed: () {
                print('Notification Icon Pressed');
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => StatsScreen()));
              },
            ),
            new IconButton(
              icon: new Icon(
                Icons.settings,
                color: Colors.black38,
              ),
              tooltip: 'Settings',
              onPressed: () {
                print('Settings Icon Pressed');
              },
            ),
            new IconButton(
              icon: new Icon(
                Icons.account_circle,
                color: Colors.black38,
              ),
              tooltip: 'Profile',
              onPressed: () {
                print('Settings Icon Pressed');
              },
            ),
          ],
        ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new NetworkImage('https://i.ytimg.com/vi/xwa1cBWWCVY/hqdefault.jpg'),
                ),
                accountName: Text(
                  "Prabeen",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
                accountEmail: Text(
                  "prabeen.strange@gmail.com",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                )),
            ListTile(
              title: Text('TRIPS'),
              trailing: Icon(Icons.train),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => TripsScreen()));
              },
            ),
            ListTile(
              title: Text('STATS'),
              trailing: Icon(Icons.show_chart),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => StatsScreen()));
              },
            ),
            ListTile(
              title: Text('MEMBERS'),
              trailing: Icon(Icons.group),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MembersScreen()));
              },
            ),
          ],
        ),
      ),
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
            icon: Icon(Icons.train),
            title: Text('TRIPS'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text('MEMBERS'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
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