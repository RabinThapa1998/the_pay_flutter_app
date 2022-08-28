import "package:flutter/material.dart";
import 'package:the_pay/util/contestent_tile.dart';

class ContestentPage extends StatefulWidget {
  ContestentPage({Key? key}) : super(key: key);

  @override
  State<ContestentPage> createState() => _ContestentPageState();
}

class _ContestentPageState extends State<ContestentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.9),
                  children: [
                ContestentTile(),
                ContestentTile(),
                ContestentTile(),
                ContestentTile(),
                ContestentTile(),
                ContestentTile(),
                ContestentTile(),
              ]))),
    );
  }
}
