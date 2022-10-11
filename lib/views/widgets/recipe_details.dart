import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RecipeDetail extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;
  final List ingredients;
  final List prepSteps;
  final List nutritions;

  RecipeDetail({
    required this.title,
    required this.cookTime,
    required this.rating,
    required this.thumbnailUrl,
    required this.ingredients,
    required this.prepSteps,
    required this.nutritions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            child: Text("Recipe Details"),
          ),
        ),
        body: Column(children: <Widget>[
          Image(image: NetworkImage(thumbnailUrl)),
          Text(title),
          Text(rating),
          Text(cookTime),
          Text("Ingredients:"),
          Expanded(
            child: SizedBox(
              height: 50.0,
              child: new ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: ingredients.length,
                itemBuilder: (context, index) {
                  return new Text("* " + ingredients[index]);
                },
              ),
            ),
          ),
          Text("Nutrition:"),
          Expanded(
            child: SizedBox(
              height: 25.0,
              child: new ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: nutritions.length,
                itemBuilder: (context, index) {
                  return new Text("* " + nutritions[index]);
                },
              ),
            ),
          ),
          Text("Instructions:"),
          Expanded(
            child: SizedBox(
              height: 300.0,
              child: new ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: prepSteps.length,
                itemBuilder: (context, index) {
                  return new Text("* " + prepSteps[index]);
                },
              ),
            ),
          ),
        ]));
  }
}
