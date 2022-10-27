import "package:flutter/material.dart";
import 'package:foodu/constants.dart';

// creates a rounded button with required parameters {text: text on button, press: button action}

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = buttonColor,
    this.textColor = backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        width: size.width * 0.7,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(29),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: color,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  foregroundColor: textColor,
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: press,
                child: Text(
                  text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
