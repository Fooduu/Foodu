
class Recipe {
  final String name;
  final String images;
  final double rating;
  final String totalTime;
  final List ingredients;
  final List prepSteps;
  final List nutrition;
  // Constructor
  Recipe({
    required this.name,
    required this.images,
    required this.rating,
    required this.totalTime,
    required this.ingredients,
    required this.prepSteps,
    required this.nutrition,
  });

  // function will map the json into a list
  // facotry constructors have no access to "this"
  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      name: json[0]['name'] as String,
      //image from api is an array, so we'll take the first element of image and take hostedLargeUrl
      images: json[0]['images'][0]['hostedLargeUrl'] as String,
      rating: json[0]['rating'] as double,
      totalTime: json[0]['totalTime'] as String,
      ingredients: json[1]
          .map((x) => x['quantity'] != null
              ? x['quantity'].toString() +
                  " " +
                  x['unit'] +
                  " " +
                  x['ingredient']
              : x['ingredient'])
          .toList(),
      prepSteps: json[2],
      nutrition: json[3].map((x)=> x['value'].toString() +" "+ x['attribute'].toString()).toList(),
    );
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
    return "Recipe{name: $name, image: $images, rating: $rating, total time:$totalTime,\n ingredients:$ingredients,\n  nutrition:$nutrition  }";
  }
}
