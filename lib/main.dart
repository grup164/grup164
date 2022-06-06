import 'package:flutter/material.dart';
import 'package:wings/views/firstscreen.dart';
import 'package:wings/views/home.dart';
import 'package:wings/views/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wings',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(primary: const Color(0xFF062B6E)),
          ),
          appBarTheme: const AppBarTheme(
            color: Color(0xFF062B6E),
          )),
      home: const FirstScreen(),
    );
  }
}
