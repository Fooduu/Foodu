import 'package:flutter/material.dart';
import 'package:foodu/views/components/tab_gesture_dect.dart';
import 'package:foodu/views/cuisine_page.dart';
import 'package:foodu/views/course_page.dart';
import 'package:foodu/views/kid_page.dart';
import 'package:foodu/views/fast_page.dart';



class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}
//
class _ExplorePageState extends State<ExplorePage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(
              children:  const [
                TabGesture(title: "Cuisines", imageUrl: "https://cdn.eathappyproject.com/wp-content/uploads/2021/10/Types-of-Cuisines-from-Around-the-World-With-their-Popular-Food.jpg", pages: CuisinePage()),
                TabGesture(title: "Courses", imageUrl: "https://cdnimg.webstaurantstore.com/uploads/blog/2020/10/12course_whatis.jpg",pages: CoursePage()),
              ],
            ),
            
            Row(
              children: const [
                TabGesture(title: "SECONDS", imageUrl: "https://www.oprah.com/g/image-resizer?width=670&link=https://static.oprah.com/images/201302/orig/201302-orig-beautiful-chicken-600x411.jpg",pages: FastPage(query: "900")),
                TabGesture(title: "Kid Friendly", imageUrl: "https://www.culinarynutrition.com/wp-content/uploads/2016/01/Silly-Face-Hummus-Toasts.jpg",pages:KidPage(query: "cuisine^cuisine-kid-friendly") ),
              ],
            ),
           
          ],
        ),
      ),
    );
  }
}

