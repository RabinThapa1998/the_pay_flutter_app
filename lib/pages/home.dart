import "package:flutter/material.dart";
import 'package:the_pay/pages/contestent_page.dart';
import 'package:the_pay/util/contestent_tile.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ContestentPage(),
      ),
    );
  }
}
