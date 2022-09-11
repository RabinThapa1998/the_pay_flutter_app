import 'package:flutter/material.dart';
import 'package:the_pay/controllers/BottomNavigationController.dart';
import 'package:the_pay/screens/Contestantpage.dart';
import 'package:the_pay/screens/VotePage.dart';
import 'package:get/get.dart';

class NavigationPage extends StatelessWidget {
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());
  NavigationPage({Key? key}) : super(key: key);
  final screens = [ContestantPage(), VotePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => IndexedStack(
              index: bottomNavigationController.selectedIndex.value,
              children: screens,
            )),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white38,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              onTap: (index) {
                bottomNavigationController.changeIndex(index);
              },
              currentIndex: bottomNavigationController.selectedIndex.value,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "contestants",
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_forward_ios),
                  label: "vote",
                  backgroundColor: Colors.black,
                ),
              ],
            )));
  }
}
