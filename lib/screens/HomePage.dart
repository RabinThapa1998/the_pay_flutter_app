import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:the_pay/components/programsCard.dart';
import 'package:the_pay/models/program/getProgramsModal.dart';
import 'package:http/http.dart';
import 'dart:convert';

List<Programs> programsList = [];
Future<List<Programs>> fetchPrograms() async {
  final response = await get(
      Uri.parse('http://192.168.1.87:8000/api/v1/dashboard/programs'));
  if (response.statusCode == 200) {
    var res = jsonDecode(response.body.toString());
    print(res);
    var data = res["data"] as List;

    for (Map i in data) {
      programsList.add(Programs.fromMap(i as Map<String, dynamic>));
    }
    return programsList;
  } else {
    throw Exception('Failed to load programs');
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future _futurePrograms;
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  void initState() {
    super.initState();
    _futurePrograms = fetchPrograms();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: _futurePrograms,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return RefreshIndicator(
              onRefresh: () async {
                programsList = [];
                setState(() {
                  _futurePrograms = fetchPrograms();
                });
              },
              child: CustomScrollView(slivers: [
                SliverAppBar(
                  pinned: _pinned,
                  snap: _snap,
                  floating: _floating,
                  forceElevated: true,
                  elevation: 10,
                  expandedHeight: 180.0,
                  flexibleSpace: const FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      'The Pay',
                    ),
                    background: FlutterLogo(),
                  ),
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                ),
                // ListView.builder(
                //     itemCount: programsList.length,
                //     itemBuilder: (context, i) {
                // return programsCard(
                //     context,
                //     screenWidth,
                //     programsList[i].name,
                //     programsList[i].desc,
                //     programsList[i].id);
                //     }),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount: programsList.length,
                      (BuildContext context, int i) {
                    return programsCard(
                        context,
                        screenWidth,
                        programsList[i].name,
                        programsList[i].desc,
                        programsList[i].id);
                  }),
                )
              ]),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
        }
        return Center(child: const CircularProgressIndicator());
      }),
    );
  }
}
