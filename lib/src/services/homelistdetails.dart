import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final DocumentSnapshot matches;
  DetailPage({this.matches});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child:ListTile(
          title: Text(widget.matches.data()), // error can occur on this line
          subtitle: Text(widget.matches.data()),
        ),
      ),
    );
  }
}