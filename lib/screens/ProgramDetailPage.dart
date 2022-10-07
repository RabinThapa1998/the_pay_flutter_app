import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_pay/models/contestant/getContestants.dart';
import 'package:the_pay/models/contestant/getModel.dart';
import 'package:the_pay/screens/VotePage.dart';
import 'package:http/http.dart';
import 'dart:convert';

// List<Contestants> contestantsList = [];
// Future<List<Contestants>> fetchContestants() async {
//   final response = await get(Uri.parse(
//       'http://192.168.1.87:8000/api/v1/dashboard/programs/633729e84f27dceef032db87'));
//   if (response.statusCode == 200) {
//     var res = jsonDecode(response.body.toString());

//     var data = res["data"]["contestants"] as List;

//     for (Map i in data) {
//       contestantsList.add(Contestants.fromMap(i as Map<String, dynamic>));
//     }
//     return contestantsList;
//   } else {
//     throw Exception('Failed to load contestents');
//   }
// }

// class ProgramDetailPage extends StatefulWidget {
//   ProgramDetailPage({Key? key}) : super(key: key);

//   @override
//   State<ProgramDetailPage> createState() => _ProgramDetailPageState();
// }

// class _ProgramDetailPageState extends State<ProgramDetailPage> {
//   late Future _futureTodos;

//   void initState() {
//     super.initState();
//     _futureTodos = fetchContestants();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FutureBuilder(
//         future: _futureTodos,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             if (snapshot.hasData) {
//               return GridView.builder(
//                   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                       maxCrossAxisExtent: 200,
//                       childAspectRatio: 12 / 16,
//                       crossAxisSpacing: 20,
//                       mainAxisSpacing: 20),
//                   itemCount: contestantsList.length,
//                   itemBuilder: (BuildContext ctx, index) {
//                     return Card(
//                       elevation: 0,
//                       shape: RoundedRectangleBorder(
//                         side: BorderSide(
//                           color: Theme.of(context).colorScheme.outline,
//                         ),
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(12)),
//                       ),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 10,
//                           ),
//                           CircleAvatar(
//                             backgroundImage:
//                                 AssetImage('assets/images/contestant.jpg'),
//                             radius: 50,
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text(contestantsList[index].fullName,
//                               style: Theme.of(context).textTheme.headline6),
//                           Text(contestantsList[index].email,
//                               style: Theme.of(context).textTheme.bodyMedium),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           ElevatedButton(
//                               onPressed: () {
//                                 Get.to(() => VotePage(),
//                                     arguments: contestantsList[index].id);
//                               },
//                               child: Text("Vote Now"))
//                         ],
//                       ),
//                     );
//                   });
//             } else if (snapshot.hasError) {
//               return Text('${snapshot.error}');
//             }
//           }
//           return const CircularProgressIndicator();
//         },
//       ),
//     );
//   }
// }

class ProgramDetailPage extends StatefulWidget {
  ProgramDetailPage({Key? key}) : super(key: key);

  @override
  State<ProgramDetailPage> createState() => _ProgramDetailPageState();
}

class _ProgramDetailPageState extends State<ProgramDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Program Detail"),
      ),
      body: Container(
        child: Text('detail Page ${Get.arguments.toString()}'),
      ),
    );
  }
}
