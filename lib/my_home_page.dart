import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:livetest9/recipes.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Recipe> recipes = [];
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
    final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (var e in decodedResponse['recipes']) {
        print('adding ${e}');
        recipes.add(
          Recipe(e['title'], e['description'], e['ingredients']),
        );
      }
    }
    // print(decodedResponse['recipes']);
    // print(recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Recipes'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: ListTile(
              title: Text(
                recipes[index].title,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                recipes[index].description,
                style: const TextStyle(color: Colors.grey, fontSize: 18),
              ),
              leading: Image.network(
                'https://www.seriouseats.com/thmb/MHMlz7l-gpIzTYPuP8Mqy7k2-u4=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/SEA-classic-panzanella-salad-recipe-hero-03-74d7b17dde8f498795387ef0c22d7215.jpg',
                width: 60,
                errorBuilder: (_,__,___){
                  return const Icon(Icons.food_bank, size: 60,);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
