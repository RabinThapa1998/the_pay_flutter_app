import 'package:flutter/material.dart';
import 'package:the_pay/pages/contestent_page.dart';
import 'package:the_pay/pages/form_page.dart';
import 'package:the_pay/pages/home.dart';
import 'package:the_pay/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  int currentIndex = 0;
  final screens = [Home(), FormPage(), HomePage()];
  @override
  Widget build(BuildContext context) {
    print(currentIndex);
    return MaterialApp(
      title: 'the pay',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) => setState(() => currentIndex = index),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                    backgroundColor: Colors.blue),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: "Feed",
                    backgroundColor: Colors.blue),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_off_outlined),
                    label: "Feed",
                    backgroundColor: Colors.blue),
              ]),
          body: Container(child: screens[currentIndex])),
      theme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.orange),
    );
  }
}
