import 'package:flutter/material.dart';
import 'package:unipiaget/ui_widgets/menu/menu.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white,
          backgroundColor: Colors.white,
          primarySwatch: Colors.orange,
          primaryIconTheme: const IconThemeData(color: Colors.black54),
          primaryTextTheme: const TextTheme(subtitle1: TextStyle(color: Colors.black54,)),
          textTheme: const TextTheme(subtitle1: TextStyle(color: Colors.black54))
      ),
      home: MenuWidgets(),
    );
  }
}
