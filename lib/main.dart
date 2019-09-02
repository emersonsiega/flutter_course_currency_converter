import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(CurrencyConverterApp());

class CurrencyConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency converter',
      theme: ThemeData(
        primaryColor: Colors.green[700],
        accentColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          fillColor: Colors.black54,
          filled: true,
          labelStyle: TextStyle(
            fontSize: 18,
            color: Colors.white54,
          ),
          prefixStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        textTheme: TextTheme(
          subhead: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
