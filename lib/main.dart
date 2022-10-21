import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodu/constants.dart';
import 'views/welcome_page.dart';
import 'views/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: backgroundColor,
          scaffoldBackgroundColor: backgroundColor),
      home: Welcome_Page(),
    );
  }
}

// delete
