import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gametour/src/screens/signInMethods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gametour/src/services/homelistpage.dart';

class HomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('Home'),
        centerTitle: true,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.amber[600],
            ),
            onPressed: (){
              auth.signOut();
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SignInMethods()));},
            child: Text(
              'Log out',
              style: TextStyle(color: Colors.black),
              ),
          ),
        ],
      ),
      body: ListPage(),
    );
  }
}
