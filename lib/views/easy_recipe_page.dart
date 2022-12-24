import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class QuickAndEasyPage extends StatefulWidget {
  const QuickAndEasyPage({Key? key}) : super(key: key);

  @override
  State<QuickAndEasyPage> createState() => _QuickAndEasyPageState();
}

class _QuickAndEasyPageState extends State<QuickAndEasyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Quick & Easy"),
      ),
      body: Center(child: Text("Quick & Easy"),
      ),
    );
  }
}