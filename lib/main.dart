import 'package:flutter/material.dart';
import 'package:the_pay/pages/contestent_page.dart';
import 'package:the_pay/pages/home.dart';
import 'package:the_pay/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'the pay',
      debugShowCheckedModeBanner: false,
      home: ContestentPage(),
      theme:
          ThemeData(brightness: Brightness.light, primarySwatch: Colors.orange),
    );
  }
}
