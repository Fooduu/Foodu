//Yummly api integration
import 'dart:convert';
import 'package:foodu/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    
    // http takes 3 arguments: authority, path, and query
    // URI is a Universal Resource Idetifier, identifying where a specific resource can be found
    var uri = Uri.https('yummly2.p.rapidapi.com', 'feeds/list',
    //list.recipe.popular is used to limit the amount of null data when query
    
        {"limit": "1", "start": "0", "tag": "list.recipe.popular"});
    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "c5cb193cddmsh787fca40c4ea65cp11c2aajsn4cba680d9168",
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List<List> temp = [];
    for (var i in data['feed']) {
      temp.add([
        i['content']['details'],//title, rating, cooktime , and image
        i['content']['ingredientLines'],//ingredients
        i['content']['preparationSteps'],//steps
        i['content']['nutrition']['nutritionEstimates'],
        
        
        ]);
    }
    return Recipe.recipesFromSnapshot(temp);
  }
}
