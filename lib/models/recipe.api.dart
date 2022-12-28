//Yummly api integration
import 'dart:convert';
import 'package:foodu/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe(String endpoints,String queryParam,String query) async {
    
    // http takes 3 arguments: authority, path, and query
    // URI is a Universal Resource Idetifier, identifying where a specific resource can be found
    //list.recipe.popular is used to limit the amount of null data when query
    //"list.recipe.popular"
    var uri;
    if (endpoints == "feeds/list"){
      uri = Uri.https('yummly2.p.rapidapi.com', 'feeds/list',{"limit": "5", "start": "0", queryParam: query});
    }
    else
    {
      uri = Uri.https('yummly2.p.rapidapi.com', 'feeds/search',{"start": "0","maxResult":"5", queryParam: query});
    }
    
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
        i['content']['nutrition']['nutritionEstimates']
        ]);
    }
    return Recipe.recipesFromSnapshot(temp);
  }
}
