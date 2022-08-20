import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  const CoffeeTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.black54),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/latte.jpg'),
            ),
            Text('Latte', style: TextStyle(fontSize: 20)),
            Text('With Almold  Milk', style: TextStyle(fontSize: 20))
          ],
        ),
      ),
    );
  }
}
