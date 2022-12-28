import 'package:flutter/material.dart';
import 'package:foodu/models/recipe.api.dart';
import 'package:foodu/models/recipe.dart';
import 'package:foodu/views/components/food_view.dart';

class ExploreRecipeCard extends StatefulWidget {
  final String query;
  final String appBarTitle;

  const ExploreRecipeCard({
    Key? key,
    required this.query,
    required this.appBarTitle,
    }) : super(key: key);

  @override
  State<ExploreRecipeCard> createState() => _ExploreRecipeCardState();
}

class _ExploreRecipeCardState extends State<ExploreRecipeCard> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe("feeds/search","allowedAttribute",widget.query);
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:  AppBar(
        title: Text(widget.appBarTitle),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
        body:
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : FoodView(recipes: _recipes)
                  );
  }
}

