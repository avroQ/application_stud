// main.dart
import 'package:flutter/material.dart';
import '/pages/log_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrange[200],
      ),
      home: LoginPage(),
    );
  }
}