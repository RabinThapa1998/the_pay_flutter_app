import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:the_pay/components/programsCard.dart';

class HomePage extends StatelessWidget {
  final imageList = [
    'assets/images/banner_1.jpg',
    'assets/images/banner_2.jpg',
    'assets/images/banner_3.jpg',
  ];
  final showList = [
    'Indian Idol',
    'Big Boss',
    'KBC',
    'X-Factor',
    'Dance India Dance',
  ];
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        child: Column(children: [
      programsCard(screenWidth),
      programsCard(screenWidth),
      programsCard(screenWidth)
    ]));
  }
}
