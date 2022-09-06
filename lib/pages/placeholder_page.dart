import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PlaceholderPage extends StatefulWidget {
  PlaceholderPage({Key? key}) : super(key: key);

  @override
  State<PlaceholderPage> createState() => _PlaceholderPageState();
}

class _PlaceholderPageState extends State<PlaceholderPage> {
  final url = "https://jsonplaceholder.typicode.com/posts?_limit=5";
  var _postData = [];
  void fetchPost() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;
      setState(() {
        _postData = jsonData;
      });
      print(_postData);
    } catch (err) {}
  }

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   fetchPost();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                fetchPost();
              },
              child: Text("Fetch")),
          Expanded(
            child: ListView.builder(
                itemCount: _postData.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  final post = _postData[i];
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.album),
                      title: Text("Title :${post["title"]}"),
                      subtitle: Text("Body :${post["body"]}"),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
