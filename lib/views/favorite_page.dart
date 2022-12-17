import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodu/constants.dart';

class FavoritePage extends StatelessWidget {
	const FavoritePage({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // This is provides the total width and height of our screen
		return Scaffold(
			body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              "Favorites",
              style: TextStyle(
                  color: buttonColor,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.3),
          ],
        ),
      ),
		);
	}
}
