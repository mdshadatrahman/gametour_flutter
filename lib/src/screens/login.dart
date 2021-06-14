import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gametour/src/screens/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('Log in'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(color: Colors.amber),
              decoration: InputDecoration(
                fillColor: Colors.amber,
                hintText: 'Email', 
                hintStyle: TextStyle(color: Colors.amber),
                ),
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.amber,
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(color: Colors.amber,),
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.amber,)
                ),
              cursorColor: Colors.amber,
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 15
                  ),
                  
                  ),
                onPressed: () async {                  
                    if(_email != null && _password != null){                      
                      try {
                        await auth.signInWithEmailAndPassword(
                          email: _email, password: _password);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => HomeScreen()));
                      } catch (e) {
                        Fluttertoast.showToast(msg: e.toString());
                      }                      
                    } else{
                      Fluttertoast.showToast(msg: 'Please enter email and password');
                    }
                  
                    
                  
                    
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber[900],
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle:
                      TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              ElevatedButton(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 15,
                    ),
                  ),
                onPressed: () async {
                  if(_email != null && _password != null){
                    try {
                      await auth.createUserWithEmailAndPassword(
                      email: _email, password: _password);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                    } catch (e) {
                      Fluttertoast.showToast(msg: e.toString());
                    }
                  } else {
                    Fluttertoast.showToast(msg: 'Please enter email and password');
                  }
                  
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange[600],
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle:
                      TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
