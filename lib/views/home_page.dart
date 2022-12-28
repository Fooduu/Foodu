import 'package:flutter/material.dart';
import 'package:foodu/models/recipe.api.dart';
import 'package:foodu/models/recipe.dart';
import 'package:foodu/views/components/food_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  late List<Recipe> _recipes;
  bool _isLoading = true;

  // the framework will call this method exactly once for each State oject it creates
  // when user click on the home icon to go to home page, this method will call getRecipes()
  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  // Asynchronous computation cannot provide a result immediately when it is started. Instead of blocking all
  //computation until the result is available, the asynchronus computation immediately returns a Future
  // which will eventually "complete" with the result. While wating, the program can do other things
  //Since API request takes time, it is best to make it achynchronous
  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe("feeds/list","tag","list.recipe.popular");

    // to ensure setState() is not called after dispose()
    if (mounted) {
      // the setState method will notify the framework that the internal state of this object has changed
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            // if still wating for api call(_isLoading = true), display loading circle, else display recipe // change to stream builder later
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : FoodView(recipes: _recipes)
                  );
  }
}

