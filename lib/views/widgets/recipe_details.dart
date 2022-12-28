import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RecipeDetail extends StatefulWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;
  final List ingredients;
  final List prepSteps;
  final List nutritions;

  RecipeDetail({
    required this.title,
    required this.cookTime,
    required this.rating,
    required this.thumbnailUrl,
    required this.ingredients,
    required this.prepSteps,
    required this.nutritions,
  });

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    // creates map that holds the recipe details to add to database if favorited
    var recipe = <String, dynamic>{
      "Title": widget.title,
      "Rating": widget.rating,
      "Cook Time": widget.cookTime,
      "Thumbnail": widget.thumbnailUrl,
      "Ingredients": widget.ingredients,
      "Instructions": widget.prepSteps,
      "Nutrition": widget.nutritions
    };
  
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text("Recipe Details"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(0, 207, 23, 23),
          elevation: 0,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: IconButton(
                icon: (_isFavorited
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border)),
                color: (_isFavorited)
                    ? Color.fromARGB(255, 255, 0, 0)
                    : Color.fromARGB(255, 255, 0, 0),
                onPressed: () {
                  setState(() {
                    // if recipe is favorited, when press it will unfavorite and remove it from the database
                    if (_isFavorited) {
                      _isFavorited = false;
                      FirebaseFirestore.instance
                          .collection("Users")                                      // searches for collection called "Users"
                          .doc(FirebaseAuth.instance.currentUser?.uid)              // searches for document in collection that matches user id
                          .update({"Recipes": FieldValue.arrayRemove([recipe])});   // updates array by searching the exact field names
                    // if recipe is not favorited, when press it will favorite it and add it to the database
                    } else {
                      _isFavorited = true;
                      FirebaseFirestore.instance
                          .collection("Users")
                          .doc(FirebaseAuth.instance.currentUser?.uid)
                          .update({"Recipes": FieldValue.arrayUnion([recipe])
                      });
                    }
                  });
                },
              ),
            )
          ],
        ),
        body: Column(children: <Widget>[
          SizedBox(height: size.height * 0.1),
          Image(image: NetworkImage(widget.thumbnailUrl)),
          Text(widget.title),
          Text(widget.rating),
          Text(widget.cookTime),
          Text("Ingredients:"),
          Expanded(
            child: SizedBox(
              height: 50.0,
              child: new ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: widget.ingredients.length,
                itemBuilder: (context, index) {
                  return new Text("* " + widget.ingredients[index]);
                },
              ),
            ),
          ),
          Text("Nutrition:"),
          Expanded(
            child: SizedBox(
              height: 25.0,
              child: new ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: widget.nutritions.length,
                itemBuilder: (context, index) {
                  return new Text("* " + widget.nutritions[index]);
                },
              ),
            ),
          ),
          Text("Instructions:"),
          Expanded(
            child: SizedBox(
              height: 300.0,
              child: new ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: widget.prepSteps.length,
                itemBuilder: (context, index) {
                  return new Text("* " + widget.prepSteps[index]);
                },
              ),
            ),
          ),
        ]));
  }
}
