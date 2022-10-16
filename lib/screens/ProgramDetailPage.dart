import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_pay/models/contestant/getContestants.dart';
import 'package:the_pay/models/contestant/getModel.dart';
import 'package:the_pay/models/program/getProgramsModal.dart';
import 'package:the_pay/screens/VotePage.dart';
import 'package:http/http.dart';
import 'dart:convert';

List<Contestants> contestantsList = [];
Map programDetail = {};

class ProgramDetails {
  ProgramDetails({
    required this.contestants,
    required this.program,
  });
  List<Contestants> contestants;
  Programs program;

  get getContestants => contestants;
  get getProgram => program;
}

Future<Map> fetchContestants() async {
  final response = await get(Uri.parse(
      'http://192.168.1.87:8000/api/v1/dashboard/programs/${Get.arguments}'));
  if (response.statusCode == 200) {
    var res = jsonDecode(response.body.toString());

    var data = res["data"]["contestants"] as List;
    for (Map i in data) {
      contestantsList.add(Contestants.fromMap(i as Map<String, dynamic>));
    }
    programDetail = res["data"]["program"];
    return {"contestants": contestantsList, "program": programDetail};
  } else {
    throw Exception('Failed to load contestents');
  }
}

class ProgramDetailPage extends StatefulWidget {
  ProgramDetailPage({Key? key}) : super(key: key);

  @override
  State<ProgramDetailPage> createState() => _ProgramDetailPageState();
}

class _ProgramDetailPageState extends State<ProgramDetailPage> {
  late Future<Map> _futureProgramDetails;

  void initState() {
    super.initState();
    _futureProgramDetails = fetchContestants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Program Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: FutureBuilder(
            future: _futureProgramDetails,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Center(
                          child: Text(programDetail["name"],
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold))),
                      Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 12 / 16,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: contestantsList.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          contestantsList[index].image_url),
                                      radius: 50,
                                      backgroundColor: Colors.transparent,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(contestantsList[index].fullName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6),
                                    Text(contestantsList[index].email,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          Get.to(() => VotePage(),
                                              arguments:
                                                  contestantsList[index].id);
                                        },
                                        child: Text("Vote Now"))
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
