import 'package:flutter/material.dart';
import 'package:meals_foodapp/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals App',
      home: HomeScreen(),
    );
  }
}
