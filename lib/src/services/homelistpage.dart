import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gametour/src/services/homelistdetails.dart';

class ListPage extends StatefulWidget {

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future getMatches() async{
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection('matches').get();
    return qn.docs;
    
  }
  navigateToDetail(DocumentSnapshot matches){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(matches: matches,)));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getMatches(),
        builder: (_, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: Text('Loading'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (_, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.amber[800],
                    title: Text(
                      snapshot.data[index].data()['title'],
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 24,                        
                        ),
                      ),
                      onTap: () => navigateToDetail(snapshot.data[index]),
                  ),
                );
              },
            );

          }
        },
      ),
      
    );
  }
}