import 'package:flutter/material.dart';
import 'package:flutter_movies/constant/app_constant.dart';
import 'package:flutter_movies/pages/movie/home_page/home_controller.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class bottomNavigationBar extends StatelessWidget {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: AppColor.primary,
              hoverColor: Colors.grey[100]!,
              activeColor: Colors.black,
              gap: 8,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: const Color.fromRGBO(245, 245, 245, 1)!,
              color: Colors.black,
              selectedIndex: 0,
               onTabChange: (value) {
                controller.currentIndex.value = value;
              },
              tabs: [
                GButton(
                  
                  padding:
                      EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  padding:
                      EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  padding:
                      EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
              
            ),
          ),
        ),
      );
  }
}