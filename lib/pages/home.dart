import "package:flutter/material.dart";
import 'package:the_pay/pages/contestent_page.dart';
import 'package:the_pay/util/contestent_tile.dart';

class Home extends StatelessWidget {
  final String name;
  final String number;
  final String email;

  const Home(
      {Key? key, required this.name, required this.email, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${name} ${number} ${email}'),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context, "popped the home");
            },
            child: Text("POP"))
      ],
    );
  }
}
