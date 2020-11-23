import 'package:flutter/material.dart';
import 'halaman_utama.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber, primarySwatch: Colors.deepOrange),
      darkTheme: ThemeData.dark(),
      home: HalamanUtama(),
    );
  }
}
