import 'package:flutter/rendering.dart';

class Recipe {
  final String name;
  final String images;
  final double rating;
  final String totalTime;
  Recipe(
      {required this.name,
      required this.images,
      required this.rating,
      required this.totalTime});

  
  // this factory constructor initialize a final variable from a JSON object
  // facotry constructors have no access to "this"
  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        name: json['name'] as String,
        //image from api is an array, so we'll take the first element of image and take hostedLargeUrl
        images: json['images'][0]['hostedLargeUrl'] as String,
        rating: json['rating'] as double,
        totalTime: json['totalTime'] as String);
  }
  //Convert list of data to list of recipe objects
  static List<Recipe> recipesFromSnapshot(List snapshot) {
    // map method will iterate over each element
    // of our list of data and will execute Recipe.fromJson() method on that element
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return "Recipe{name: $name, image: $images, rating: $rating, total time:$totalTime}";
  }
}
