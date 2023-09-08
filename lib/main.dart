import 'package:flutter/material.dart';
import 'package:flutter_movies/pages/movie/detail_page/detail_page.dart';
import 'package:flutter_movies/pages/movie/home_page/home_page.dart';
import 'package:flutter_movies/pages/movie/search_page/search_page.dart';
import 'package:flutter_movies/pages/user/profile_page/profile_page.dart';
import 'package:flutter_movies/pages/user/register_page/register_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/registration',
      getPages: [
        GetPage(name: '/registration', page: () => RegisterPage()),
        GetPage(name: '/profilePage', page: () => ProfilePage()),
        GetPage(name: '/searchPage', page:() => SearchPage()),
        GetPage(name: '/homePage', page: () => HomePage()),
        GetPage(name: '/detailMoviePage', page: () => DetailMoviePage())
      ],
    );
  }
}
