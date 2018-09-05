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


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // appBar: AppBar(title: Text('Feed'),),
      body: Center(
        child: Text('Feed Screen'),
      ),
      floatingActionButton:
            FancyFab() // This trailing comma makes auto-formatting nicer for build methods.
        )
      );
  }
}