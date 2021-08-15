import 'package:flutter/material.dart';
import 'package:khalti_pay/payPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khalti Pay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple[900],
      ),
      home: PayPage(),
    );
  }
}