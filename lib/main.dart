import 'package:flutter/material.dart';
import 'package:interview/new.dart';
import 'package:interview/newscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSON API App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: EmployeeListWidget(),
    );
  }
}
