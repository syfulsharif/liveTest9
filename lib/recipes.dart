import 'package:flutter/material.dart';

class Recipe {
  final String title, description;
  final List<dynamic> ingredients;

  Recipe(this.title, this.description, this.ingredients);

  factory Recipe.fromJSON(Map<String, dynamic> e) {
  return Recipe(
      e['title'],
      e['description'],
      e['ingredients']
  );
  }
}