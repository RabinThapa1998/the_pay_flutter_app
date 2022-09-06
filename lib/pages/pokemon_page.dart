import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PokemonPage extends StatefulWidget {
  PokemonPage({Key? key}) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  var _pokeData = [];
  final url = "https://pokeapi.co/api/v2/pokemon";

  void fetchPokemon() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);
      print(jsonData);
      setState(() {
        _pokeData = jsonData["results"] as List;
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    print("hellow");
    fetchPokemon();
  }

  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: _pokeData.length,
          itemBuilder: (context, i) {
            final pokemon = _pokeData[i];
            return Card(
              child: ListTile(
                leading: Icon(Icons.album),
                title: Text("Pokemon :${pokemon["name"]}"),
                // subtitle: Text("Body :${pokemon[""]}")
              ),
            );
          }),
    );
  }
}
