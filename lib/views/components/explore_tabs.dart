import "package:flutter/material.dart";

class ExploreTab extends StatelessWidget {
  final String text;
  final String image;
  const ExploreTab({
    Key? key,
    required this.text, 
    required this.image,
  }) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(53, 65, 25, 11),
      width: 195 ,
      height: 171,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
          image: NetworkImage(
              image),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )
      ),
    );
  }
}