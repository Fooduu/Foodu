import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FastPage extends StatefulWidget {
  const FastPage({Key? key}) : super(key: key);

  @override
  State<FastPage> createState() => _FastPageState();
}
//
class _FastPageState extends State<FastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("SECONDS"),
      ),
      body: Center(child: Text("SECONDS"),
      ),
    );
  }
}