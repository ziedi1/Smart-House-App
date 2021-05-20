import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomData extends StatefulWidget {
  CustomData({this.app});
  final FirebaseApp app;
  @override
  _CustomDataState createState() => _CustomDataState();
}

class _CustomDataState extends State<CustomData> {
  final referenceDatabase=FirebaseDatabase.instance;
  final movieName='MovieTitle';
  final movieController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ref=referenceDatabase.reference();


    return Scaffold(
      appBar: AppBar(
        title: Text('Movies That i Love'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                color: Colors.green,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Text (
                      movieName,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: movieController,
                      textAlign: TextAlign.center,
                    ),
                    FlatButton(
                      color: Colors.grey,
                      onPressed: (){
                      ref
                      .child('Movies')
                          .push()
                          .child(movieName)
                          .set(movieController.text)
                          .asStream();
                    }, child: Text('Save movie'),
                    textColor: Colors.white,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
