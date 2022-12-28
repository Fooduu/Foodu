import "package:flutter/material.dart";
import 'package:foodu/views/components/explore_tabs.dart';


class TabGesture extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Widget pages;
  const TabGesture({
    required this.title,
    required this.imageUrl,

    required this.pages,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ExploreTab(text: title, image: imageUrl) ,
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) {
          return pages;
        }),
        );
      },
    );
  }
}