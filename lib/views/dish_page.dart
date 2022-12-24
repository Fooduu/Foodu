import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DishPage extends StatefulWidget {
  const DishPage({Key? key}) : super(key: key);
//
  @override
  State<DishPage> createState() => _DishPageState();
}

class _DishPageState extends State<DishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Cuisine"),
      ),
      body: Center(child: Text("Cuisine"),
      ),
    );
  }
}