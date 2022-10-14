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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Vote'),
        ),
        body: Column(
          children: [
            Card(
              child: Row(
                children: [
                  Text(Get.arguments.toString()),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            Text(
              "Packages",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Container(
                          child: Text("2"),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        title: const Text('Rs 12'),
                        subtitle: const Text('Submit 2 votes for Rs 12'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
