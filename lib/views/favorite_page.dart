import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late List<dynamic> recipes;

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  // getData() {
  //   FirebaseFirestore.instance
  //       .collection("Users")
  //       .doc(FirebaseAuth.instance.currentUser?.uid)
  //       .get()
  //       .then((value) {
  //     print(value)
  //     recipes = value.data()["Recipes"];
  //     print(recipes);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
