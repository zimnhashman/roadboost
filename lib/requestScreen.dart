import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'acceptedScreen.dart';

class Request extends StatefulWidget {

  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {

  @override
  void initState() {
    super.initState();

     Timer(
        Duration(seconds: 15),
            () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => Accept())));

  }




  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('CONFIRMATION'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Center(child: Text('REQUEST SENT', style: TextStyle(
            color: Colors.blue,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.grey[200],
          ),)),
        ],
      ),
    );
  }
}
