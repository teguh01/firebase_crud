import 'package:flutter/material.dart';

class Petunjuk extends StatefulWidget {
  @override
  _PetunjukState createState() => _PetunjukState();
}

class _PetunjukState extends State<Petunjuk> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[  
            new Card(
              child: new Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0), 
                    child: new Text("Petunjuk Penggunaan"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }  
}