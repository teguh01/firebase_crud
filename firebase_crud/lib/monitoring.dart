import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'sensor.dart';

class Monitoring extends StatefulWidget {
  @override
  _MonitoringState createState() => _MonitoringState();
}

class _MonitoringState extends State<Monitoring> {

  String json = 'Json';

  DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child('DHT');
  DatabaseReference keadaanSehat = FirebaseDatabase.instance.reference().
    child('DHT').
    child('Json');

  //create database pakai set({'keadaan': 'Sehat'})
  //delete database pakai remove()

  void sehat(){
    keadaanSehat.update({'keadaan': 'Sehat'});
  }

  void tidakSehat(){
    keadaanSehat.update({'keadaan': 'Tidak Sehat'});
  }

  void keadaanTambak(DHT _dht)async{
    if(_dht.temp >= 20 && _dht.temp <= 30 && 
       _dht.humidity >= 20 &&  _dht.humidity <= 30 && 
       _dht.heatIndex >= 20 && _dht.heatIndex <= 30){ 
      sehat();   
    }
    else{
      tidakSehat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return mainScaffold();
  }

  Widget mainScaffold(){
    return Scaffold(
      body: StreamBuilder(
        stream: databaseReference.onValue,
        builder: (context, snapshot){
          if(snapshot.hasData && 
             !snapshot.hasError && 
             snapshot.data.snapshot.value != null){
            var _dht = DHT.fromJson(snapshot.data.snapshot.value[json]);
            keadaanTambak(_dht);
            return tampilData(_dht);
          }         
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
    );
  }

  Widget tampilData(DHT _dht){
    return Center(
      child: ListView(
        padding: new EdgeInsets.all(10.0),
        children: <Widget>[
          new Card(
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text("Temperature = ${_dht.temp}"),
                )
              ],
            ),
          ),
          new Card(
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text("Kelembapan = ${_dht.humidity}"),
                )
              ],
            ),
          ),
          new Card(
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text("Heat Index = ${_dht.heatIndex}"),
                )
              ],
            ),
          ),
          new Card(
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text("Keadaan = ${_dht.keadaan}"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}