import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_pay/screens/Contestantpage.dart';
import 'package:the_pay/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'the pay',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("The Pay"),
        ),
        body: Container(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ContestantPage(),
        )),
      ),
    );
  }
}
