import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VotePage extends StatefulWidget {
  VotePage({Key? key}) : super(key: key);

  @override
  State<VotePage> createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Card(
              child: Row(
                children: [
                  Text(Get.arguments.toString()),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: const Icon(Icons.abc),
                        title: const Text('Contestant'),
                        subtitle: const Text('Subtitle'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
