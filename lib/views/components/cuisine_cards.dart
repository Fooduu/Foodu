import "package:flutter/material.dart";

class CuisineCard extends StatelessWidget {
  final String text;
  final String image;
  const CuisineCard({
    Key? key,
    required this.text, 
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(19, 11, 19, 11),
      width: 349,
      height: 147,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              image),
        ),
      ),
      child: Text(
        text,
      ),
    );
  }
}