import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(CurrencyConverterApp());

class CurrencyConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency converter',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.orange[800],
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
