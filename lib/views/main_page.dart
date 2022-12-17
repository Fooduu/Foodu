import 'package:flutter/material.dart';
import 'package:foodu/views/explore_page.dart';
import 'package:foodu/views/favorite_page.dart';
import 'package:foodu/views/home_page.dart';
import 'package:foodu/views/profile_page.dart';
import 'package:foodu/views/shopping_list_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// This main page can act as the base page for all of our screens which will contains the bottom navigation bar 
class Main_Page extends StatefulWidget {
  const Main_Page({Key? key}) : super(key: key);

  @override
  State<Main_Page> createState() => _MainPageState();
}

class _MainPageState extends State<Main_Page> {
  //initialize selected index to 0 to make Home page the default page when first logged in
  int _selectedIndex = 0;
  // list of widgets index based on the location of icon in the navigation bar
  final List<Widget> _pages = [HomePage(),ExplorePage(),FavoritePage(),ShoppingPage(),ProfilePage()];

  void _navigateBottomBar(int index) {
    // the setState method will notify the framework that the selected index has changed
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: const Color.fromARGB(255, 58, 57, 57),
              padding: const EdgeInsets.all(16),
              gap: 8, //Gap between icon and text
              onTabChange: _navigateBottomBar,// when a tab is clicked, call nagivateBottomBar to set new index
              tabs: const [
                GButton(
                  icon: Icons.home, 
                  text: "Home"),
                GButton(
                  icon: Icons.explore_outlined,
                  text: "Explore"),
                GButton(
                  icon: Icons.favorite_border, 
                  text: "Favorites"),
                GButton(
                  icon: Icons.list_alt_rounded,
                   text: "Cart"),
                GButton(
                  icon: Icons.account_circle_outlined,
                  text: "Profile",
                ),
              ]),
        ),
      ),
    );
  }
}
