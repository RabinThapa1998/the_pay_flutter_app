import 'dart:ui';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:the_pay/screens/ProgramDetailPage.dart';

Padding programsCard(context, double screenWidth, String title, String desc,
    String image_url, String id) {
  return Padding(
    key: ValueKey(id),
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
              image: NetworkImage(image_url),
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
            height: 120,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRect(
                    child: new BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(title,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25)),
                            Text(desc,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                )),
                          ],
                        )))),
          ),
        ),
        Positioned(
          top: 50,
          child: ElevatedButton(
            onPressed: () {
              Get.to(() => ProgramDetailPage(), arguments: id);
            },
            style: ElevatedButton.styleFrom(shape: CircleBorder()),
            child: Container(
                height: 80,
                width: 80,
                child: Center(
                  child: Text(
                    "More",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )),
          ),
        ),
      ],
    ),
  );
}
