import 'dart:ui';

import 'package:flutter/material.dart';

Padding programsCard(double screenWidth, String title, String desc) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          height: 300,
          width: screenWidth,
          // color: Colors.deepPurpleAccent,

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/banner_1.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        Positioned(
          bottom: 10,
          child: Container(
            width: screenWidth - 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            height: 100,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRect(
                    child: new BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("X-Factor",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25)),
                            Text("Vote for the best lorem lorem ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ],
                        )))),
          ),
        ),
      ],
    ),
  );
}
