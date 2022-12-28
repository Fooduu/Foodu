import 'package:foodu/views/components/tab_gesture_dect.dart';
import 'package:flutter/material.dart';
import 'package:foodu/views/widgets/explore_recipe_card.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}
//
class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size;
    return Scaffold(
      
      extendBodyBehindAppBar: true,
      appBar:  AppBar(
        title: Text("Course"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        
        child: Column(
          children: [
            SizedBox(height: size.height * 0.12),
            Row(
              children:  const[
                TabGesture(
                  title: "Main Dishes", 
                  imageUrl: "https://cdn.eathappyproject.com/wp-content/uploads/2021/10/Types-of-Cuisines-from-Around-the-World-With-their-Popular-Food.jpg", 
                  pages: ExploreRecipeCard(query: "course^course-Main Dishes",appBarTitle: "Main Dishes")),
                TabGesture(
                  title: "Desserts", 
                  imageUrl: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2017/10/3/0/FNM_110117-Insert-Opener-2_s4x3.jpg.rend.hgtvcom.616.462.suffix/1507047894789.jpeg", 
                  pages: ExploreRecipeCard(query: "course^course-Desserts",appBarTitle: "Desserts"))
              ],
            ),
            Row(
              children: const[
                TabGesture(title: "Appetizers", 
                imageUrl: "https://www.thehealthy.com/wp-content/uploads/2019/05/food-healthy.jpg?fit=640,480",
                pages: ExploreRecipeCard(query: "course^course-Appetizers",appBarTitle: "Appetizers")),
                TabGesture(
                  title: "Salads", 
                  imageUrl: "https://cdnimg.webstaurantstore.com/uploads/blog/2020/10/12course_whatis.jpg",
                  pages: ExploreRecipeCard(query: "course^course-Salads",appBarTitle: "Salads")),
              ],
            ),
            Row(
              children: const[
                TabGesture(
                  title: "Soups", 
                  imageUrl: "https://www.expatica.com/app/uploads/sites/5/2014/05/french-food-1920x1080.jpg",
                  pages: ExploreRecipeCard(query: "course^course-Soups",appBarTitle: "Mexican")),
                TabGesture(
                  title: "Breads", 
                  imageUrl: "https://www.culinarynutrition.com/wp-content/uploads/2016/01/Silly-Face-Hummus-Toasts.jpg",
                  pages:ExploreRecipeCard(query: "course^course-Breads",appBarTitle: "French") ),
              ],
            ),
            Row(
              children: const[
                TabGesture(
                  title: "Cocktails", 
                  imageUrl: "https://loveincorporated.blob.core.windows.net/contentimages/gallery/5042cb85-5a72-44ad-aa35-fd7893ff9f36-11%20sliceofpai.jpg",
                  pages: ExploreRecipeCard(query: "course^course-Cocktails",appBarTitle: "Southwestern")),
                TabGesture(
                  title: "Lunch", 
                  imageUrl: "https://www.oprah.com/g/image-resizer?width=670&link=https://static.oprah.com/images/201302/orig/201302-orig-beautiful-chicken-600x411.jpg",
                  pages: ExploreRecipeCard(query: "course^course-Lunch",appBarTitle: "Indian")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}