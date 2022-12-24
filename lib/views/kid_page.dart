import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class KidPage extends StatefulWidget {
  const KidPage({Key? key}) : super(key: key);

  @override
  State<KidPage> createState() => _KidPageState();
}

class _KidPageState extends State<KidPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Kid Friendly"),
      ),
      body: Center(child: Text("Kid Friendly"),
      ),
    );
  }
}