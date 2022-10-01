import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

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
    return SingleChildScrollView(
        child: Center(
      child: Column(children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 0,
          color: Theme.of(context).splashColor,
          child: SizedBox(
            height: 100,
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Hello'),
                    Text("Robin"),
                  ],
                ),
                Column(
                  children: [
                    Text('Vote for the best'),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ],
            ),
          ),
        ),
        // SizedBox(
        //   height: 200,
        //   width: 300,
        //   child: Swiper(
        //     itemBuilder: (BuildContext context, int index) {
        //       return Image.asset(
        //         imageList[index],
        //         fit: BoxFit.cover,
        //       );
        //     },
        //     itemCount: imageList.length,
        //     pagination: SwiperPagination(),
        //     // control: SwiperControl(),
        //     // autoplay: false,
        //     // duration: 1000,
        //   ),
        // ),
      ]),
    ));
  }
}
