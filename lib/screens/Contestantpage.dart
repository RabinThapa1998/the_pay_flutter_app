import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_pay/models/contestant/getContestants.dart';
import 'package:the_pay/models/contestant/getModel.dart';
import 'package:the_pay/screens/VotePage.dart';
import 'package:http/http.dart';
import 'dart:convert';

List<Contestants> contestantsList = [];
Future<List<Contestants>> fetchContestants() async {
  final response = await get(
      Uri.parse('http://192.168.1.87:8000/api/v1/dashboard/contestants'));
  if (response.statusCode == 200) {
    var res = jsonDecode(response.body.toString());
    print(res);
    var data = res["data"] as List;

    for (Map i in data) {
      contestantsList.add(Contestants.fromMap(i as Map<String, dynamic>));
    }
    return contestantsList;
  } else {
    throw Exception('Failed to load contestents');
  }
}

class ContestantPage extends StatefulWidget {
  ContestantPage({Key? key}) : super(key: key);

  @override
  State<ContestantPage> createState() => _ContestantPageState();
}

class _ContestantPageState extends State<ContestantPage> {
  late Future _futureTodos;

  void initState() {
    super.initState();
    _futureTodos = fetchContestants();
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //     child: GridView.count(
    //   crossAxisCount: 2,
    //   children: List.generate(6, (index) {
    //     return Card(
    //       child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    //         CircleAvatar(
    //           backgroundImage: AssetImage('images/contestant.jpg'),
    //           radius: 50,
    //         ),
    //         SizedBox(
    //           height: 10,
    //         ),
    //         Text("contestant name",
    //             style: Theme.of(context).textTheme.headline6),
    //         Text("location", style: Theme.of(context).textTheme.bodyMedium),
    //         SizedBox(
    //           height: 10,
    //         ),
    //         ElevatedButton(
    //             onPressed: () {
    //               Get.to(VotePage(), arguments: "hello from contestant");
    //             },
    //             child: Text("Vote Now"))
    //       ]),
    //     );
    //   }),
    // ));
    return Container(
      child: FutureBuilder(
        future: _futureTodos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: contestantsList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(contestantsList[index].fullName),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
