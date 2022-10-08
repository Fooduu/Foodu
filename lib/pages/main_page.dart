import 'package:flutter/material.dart';
import 'package:foodu/pages/favorite_page.dart';
import 'package:foodu/pages/home_page.dart';
import 'package:foodu/pages/profile_page.dart';
import 'package:foodu/pages/shopping_list_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Main_Page extends StatefulWidget {
  const Main_Page({Key? key}) : super(key: key);

  @override
  State<Main_Page> createState() => _MainPageState();
}

class _MainPageState extends State<Main_Page> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [Home_Page(),Favorite_Page(),Shopping_Page(),Profile_Page()];

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Color.fromARGB(255, 58, 57, 57),
              padding: EdgeInsets.all(16),
              gap: 8, //Gap between icon and text
              onTabChange: _navigateBottomBar,
              tabs: [
                GButton(
                  icon: Icons.home, 
                  text: "Home"),
                GButton(
                  icon: Icons.favorite_border, 
                  text: "Favorites"),
                GButton(
                  icon: Icons.list_alt_rounded,
                   text: "Shopping List"),
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
