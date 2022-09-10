import 'dart:html';

import 'package:flutter/material.dart';

class ContestantPage extends StatefulWidget {
  ContestantPage({Key? key}) : super(key: key);

  @override
  State<ContestantPage> createState() => _ContestantPageState();
}

class _ContestantPageState extends State<ContestantPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
      crossAxisCount: 2,
      children: List.generate(6, (index) {
        return Card(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/contestant.jpg'),
              radius: 50,
            ),
            SizedBox(
              height: 10,
            ),
            Text("contestant name",
                style: Theme.of(context).textTheme.headline6),
            Text("location", style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () {}, child: Text("Vote Now"))
          ]),
        );
      }),
    ));
  }
}
