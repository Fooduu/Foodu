
import 'package:flutter/material.dart';
import 'package:foodu/models/recipe.dart';
import 'package:foodu/models/recipe.api.dart';
import 'package:foodu/views/components/food_view.dart';

class FastPage extends StatefulWidget {

  final String query;

  const FastPage({
    Key? key,
    required this.query
    }) : super(key: key);
  
  @override
  State<FastPage> createState() => _FastPageState();
}
//
class _FastPageState extends State<FastPage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

   @override
  void initState() {
    super.initState();
    getFastRecipes();
  }

  Future<void> getFastRecipes() async {
    _recipes = await RecipeApi.getRecipe("feeds/search","maxTotalTimeInSeconds",widget.query);
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
        title: Text("SECONDS"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: _isLoading
        ? Center(child: CircularProgressIndicator())
        : FoodView(recipes: _recipes)
      
    );
  }
}