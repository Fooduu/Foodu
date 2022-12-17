import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodu/models/recipe.api.dart';
import 'package:foodu/models/recipe.dart';
import 'package:foodu/views/widgets/recipe_card.dart';
import 'package:foodu/views/widgets/recipe_details.dart';

import 'components/cuisine_cards.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late List<Recipe> _recipes;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();

    // to ensure setState() is not called after dispose()
    if (this.mounted) {
      // the setState method will notify the framework that the internal state of this object has changed
      setState(() {
        print(_recipes);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.06),
            const CuisineCard(text: "Asian", image: "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F19%2F2017%2F08%2F17%2FGettyImages-545286388-2000.jpg&q=60"),
            const CuisineCard(text: "Italian", image: "https://www.realsimple.com/thmb/n7LREb712VOF9dHoWYQFKAxidMw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/italian-food-2000-465639d6117745278d67deebd968cd1e.jpg"),
            const CuisineCard(text: "Mexican", image: "https://kdvr.com/wp-content/uploads/sites/11/2022/05/GettyImages-913649914.jpg?w=2560&h=1440&crop=1"),
            const CuisineCard(text: "French", image: "https://www.expatica.com/app/uploads/sites/5/2014/05/french-food-1920x1080.jpg"),
          ],
        ),
      ),
    );
  }
}