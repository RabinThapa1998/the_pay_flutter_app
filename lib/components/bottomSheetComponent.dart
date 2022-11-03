import 'dart:ui';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:the_pay/screens/EsewaEpay.dart';

Container bottomSheetComponent() {
  return Container(
      height: 400,
      child: ListView(children: [
        Row(
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[200],
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                onPressed: () {
                  Get.to(EsewaEpay());
                },
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/esewa.png',
                      height: 100,
                      width: 100,
                    ),
                    Text("Esewa"),
                  ],
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[200],
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                onPressed: () {
                  Get.to(EsewaEpay());
                },
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/khalti.png',
                      height: 100,
                      width: 100,
                    ),
                    Text("Khalti"),
                  ],
                )),
          ],
        )
      ]),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      )));
}
