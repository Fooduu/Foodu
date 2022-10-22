// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:foodu/constants.dart';
import 'package:foodu/views/login_page.dart';

class Welcome_Page extends StatelessWidget {
  const Welcome_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // This is provides the total width and height of our screen
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 300), // margin from the top of the screen
        child: Column(
          children: <Widget>[
            Text(
              "Welcome to Foodu",
              style: TextStyle(color: textColor, fontSize: 35),
            ),
            Container(
              width: size.width * 0.7,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: FlatButton(
                    // ignore: prefer_const_constructors
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    color: textColor,
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: backgroundColor),
                    )),
              ),
            ),
            Container(
              width: size.width * 0.7,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: FlatButton(
                    // ignore: prefer_const_constructors
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    color: textColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: backgroundColor),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
