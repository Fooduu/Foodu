import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodu/models/recipe.api.dart';
import 'package:foodu/models/recipe.dart';
import 'package:foodu/views/widgets/recipe_card.dart';
import 'package:foodu/views/widgets/recipe_details.dart';

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
    _recipes = await RecipeApi.getRecipe();

    // to ensure setState() is not called after dispose()
    if (this.mounted) {
    // the setState method will notify the framework that the internal state of this object has changed
      setState(() {
        _isLoading = false;
        print(_recipes);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
          children: [
            Icon(Icons.restaurant_menu),
            Text('Foodu'),
          ],
        )),
        body:
            // if still wating for api call(_isLoading = true), display loading circle, else display recipe // change to stream builder later
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
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
                  ));
  }
}
