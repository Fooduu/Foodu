import "package:flutter/material.dart";
import 'package:foodu/models/recipe.dart';
import 'package:foodu/views/widgets/recipe_details.dart';
import '../widgets/recipe_card.dart';

class FoodView extends StatelessWidget {
  const FoodView({
    Key? key,
    required List<Recipe> recipes,
  }) : _recipes = recipes, super(key: key);

  final List<Recipe> _recipes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _recipes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: RecipeCard(
                title: _recipes[index].name,
                rating: _recipes[index].rating.toString(),
                cookTime: _recipes[index].totalTime,
                thumbnailUrl: _recipes[index].images),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return RecipeDetail(
                  title: _recipes[index].name,
                  rating: _recipes[index].rating.toString(),
                  cookTime: _recipes[index].totalTime,
                  thumbnailUrl: _recipes[index].images,
                  ingredients: _recipes[index].ingredients,
                  prepSteps: _recipes[index].prepSteps,
                  nutritions: _recipes[index].nutrition,
                );
              }));
            },
          );
        },
      );
  }
}
