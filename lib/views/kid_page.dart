import 'package:flutter/material.dart';
import 'package:foodu/models/recipe.dart';
import 'package:foodu/models/recipe.api.dart';
import 'package:foodu/views/components/food_view.dart';

class KidPage extends StatefulWidget {
  final String query;
  const KidPage({
    Key? key,
    required this.query,
    }) : super(key: key);

  @override
  State<KidPage> createState() => _KidPageState();
}
class _KidPageState extends State<KidPage> {
  
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getKidFriendlyRecipes();
  }

  Future<void> getKidFriendlyRecipes() async {
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
        title: Text("Kid Friendly"),
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
