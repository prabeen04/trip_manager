import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/fancy_fab.dart';

class FeedScreen extends StatefulWidget {
  @override
  FeedScreenState createState() {
    return new FeedScreenState();
  }
}

class FeedScreenState extends State<FeedScreen> {
  String myText;
  StreamSubscription<DocumentSnapshot> subscription;

  final DocumentReference documentReference =
      Firestore.instance.document("myData/dummy");

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithGoogle(
        idToken: gSA.idToken, accessToken: gSA.accessToken);

    print("User Name : ${user.displayName}");
    return user;
  }

  void _signOut() {
    googleSignIn.signOut();
    print("User Signed out");
  }

  void _add() {
    Map<String, String> data = <String, String>{
      "name": "Pawan Kumar",
      "desc": "Flutter Developer"
    };
    documentReference.setData(data).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
  }

  void _delete() {
    documentReference.delete().whenComplete(() {
      print("Deleted Successfully");
      setState(() {});
    }).catchError((e) => print(e));
  }

  void _update() {
    Map<String, String> data = <String, String>{
      "name": "Pawan Kumar Updated",
      "desc": "Flutter Developer Updated"
    };
    documentReference.updateData(data).whenComplete(() {
      print("Document Updated");
    }).catchError((e) => print(e));
  }

  void _fetch() {
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        setState(() {
          myText = datasnapshot.data['desc'];
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription = documentReference.snapshots().listen((datasnapshot) {
      if (datasnapshot.exists) {
        setState(() {
          myText = datasnapshot.data['desc'];
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            // appBar: AppBar(title: Text('Feed'),),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => _signIn()
                        .then((FirebaseUser user) => print(user))
                        .catchError((e) => print(e)),
                    child: Text("Sign In"),
                    color: Colors.green,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  RaisedButton(
                    onPressed: _signOut,
                    child: Text("Sign out"),
                    color: Colors.red,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  RaisedButton(
                    onPressed: _add,
                    child: Text("Add"),
                    color: Colors.cyan,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  RaisedButton(
                    onPressed: _update,
                    child: Text("Update"),
                    color: Colors.lightBlue,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  RaisedButton(
                    onPressed: _fetch,
                    child: Text("Fetch"),
                    color: Colors.lime,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  myText == null
                      ? Container()
                      : Text(
                          myText,
                          style: TextStyle(fontSize: 20.0),
                        )
                ],
              ),
            ),
            floatingActionButton:
                FancyFab() // This trailing comma makes auto-formatting nicer for build methods.
            ));
  }
}
