import 'package:flutter/material.dart';

class MatchDetails extends StatelessWidget {
  final String title;
  MatchDetails(this.title); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Text('Details of the title you pressed'),
    );
  }
}