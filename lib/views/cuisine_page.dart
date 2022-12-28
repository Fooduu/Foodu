import 'package:foodu/views/components/tab_gesture_dect.dart';
import 'package:flutter/material.dart';
import 'package:foodu/views/widgets/explore_recipe_card.dart';

class CuisinePage extends StatefulWidget {
  const CuisinePage({Key? key}) : super(key: key);

  @override
  State<CuisinePage> createState() => _CuisinePageState();
}
//
class _CuisinePageState extends State<CuisinePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size;
    return Scaffold(
      
      extendBodyBehindAppBar: true,
      appBar:  AppBar(
        title: Text("Cuisine"),
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
                  title: "American", 
                  imageUrl: "https://cdn.eathappyproject.com/wp-content/uploads/2021/10/Types-of-Cuisines-from-Around-the-World-With-their-Popular-Food.jpg", 
                  pages: ExploreRecipeCard(query: "cuisine^cuisine-american",appBarTitle: "American")),
                TabGesture(
                  title: "Barbecue", 
                  imageUrl: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2017/10/3/0/FNM_110117-Insert-Opener-2_s4x3.jpg.rend.hgtvcom.616.462.suffix/1507047894789.jpeg", 
                  pages: ExploreRecipeCard(query: "cuisine^cuisine-barbecue-bbq",appBarTitle: "Barbecue"))
              ],
            ),
            Row(
              children: const[
                TabGesture(title: "Asian", 
                imageUrl: "https://www.thehealthy.com/wp-content/uploads/2019/05/food-healthy.jpg?fit=640,480",
                pages: ExploreRecipeCard(query: "cuisine^cuisine-asian",appBarTitle: "Asian")),
                TabGesture(
                  title: "Italian", 
                  imageUrl: "https://cdnimg.webstaurantstore.com/uploads/blog/2020/10/12course_whatis.jpg",
                  pages: ExploreRecipeCard(query: "cuisine^cuisine-italian",appBarTitle: "Italian")),
              ],
            ),
            Row(
              children: const[
                TabGesture(
                  title: "Mexican", 
                  imageUrl: "https://www.expatica.com/app/uploads/sites/5/2014/05/french-food-1920x1080.jpg",
                  pages: ExploreRecipeCard(query: "cuisine^cuisine-mexican",appBarTitle: "Mexican")),
                TabGesture(
                  title: "French", 
                  imageUrl: "https://www.culinarynutrition.com/wp-content/uploads/2016/01/Silly-Face-Hummus-Toasts.jpg",
                  pages:ExploreRecipeCard(query: "cuisine^cuisine-french",appBarTitle: "French") ),
              ],
            ),
            Row(
              children: const[
                TabGesture(
                  title: "Southwestern", 
                  imageUrl: "https://loveincorporated.blob.core.windows.net/contentimages/gallery/5042cb85-5a72-44ad-aa35-fd7893ff9f36-11%20sliceofpai.jpg",
                  pages: ExploreRecipeCard(query: "cuisine^cuisine-southwestern",appBarTitle: "Southwestern")),
                TabGesture(
                  title: "Indian", 
                  imageUrl: "https://www.oprah.com/g/image-resizer?width=670&link=https://static.oprah.com/images/201302/orig/201302-orig-beautiful-chicken-600x411.jpg",
                  pages: ExploreRecipeCard(query: "cuisine^cuisine-indian",appBarTitle: "Indian")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}