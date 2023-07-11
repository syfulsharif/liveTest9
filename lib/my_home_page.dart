import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecipes();
  }

  void getRecipes() async {
    //https://raw.githubusercontent.com/syfulsharif/crud_app_live_1/main/lib/recipies.json
    Response response = await get(
      Uri.parse(
          'https://raw.githubusercontent.com/syfulsharif/crud_app_live_1/main/lib/recipies.json'),
    );
    final Map <String, dynamic> decodedResponse = jsonDecode(response.body);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Recipes'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile();
        },
      ),
    );
  }
}
