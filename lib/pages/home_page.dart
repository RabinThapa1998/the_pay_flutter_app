import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_pay/util/coffee_tile.dart';
import 'package:the_pay/util/coffee_type.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text("Find the best coffee for you".toUpperCase(),
              style: GoogleFonts.bebasNeue(
                fontSize: 56,
              )),
        ),
        SizedBox(
          height: 25,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Find Your Coffee...',
                  prefixIcon: Icon(Icons.search),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600))),
            )),
        SizedBox(
          height: 25,
        ),
        Container(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeType(coffeeType: "Cappucino", isSelected: true),
                CoffeeType(coffeeType: "Latte", isSelected: false),
                CoffeeType(coffeeType: "Milk", isSelected: false),
              ],
            )),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(),
              CoffeeTile(),
              CoffeeTile(),
            ],
          ),
        )
      ]),
    );
  }
}