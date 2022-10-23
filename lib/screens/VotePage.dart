import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_pay/screens/EsewaEpay.dart';

class VotePage extends StatefulWidget {
  VotePage({Key? key}) : super(key: key);

  @override
  State<VotePage> createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  late List paymentSchema;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paymentSchema =
        Get.arguments != null ? Get.arguments["payment_schema"] : [];
    print("----------payment schema ${paymentSchema} ");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Vote'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('assets/images/contestant.jpg'),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                          Get.arguments != null
                              ? Get.arguments["fullName"].toString()
                              : 'loading...',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Text(
                "Packages",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: paymentSchema.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: ListTile(
                            tileColor: Colors.white,
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(paymentSchema[index]["votes"].toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text("Votes",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                            ),
                            title:
                                Text(paymentSchema[index]["votes"].toString()),
                            subtitle: Text(
                                'Submit ${paymentSchema[index]["votes"].toString()} votes for Rs ${paymentSchema[index]["cost"].toString()}'),
                            trailing: ElevatedButton(
                              onPressed: () {
                                Get.to(EsewaEpay());
                              },
                              child: Text("Pay"),
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
