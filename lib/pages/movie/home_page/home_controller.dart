import 'package:flutter/material.dart';
import 'package:flutter_movies/pages/movie/home_page/home_view_page.dart';
import 'package:flutter_movies/pages/movie/search_page/search_page.dart';
import 'package:flutter_movies/pages/user/profile_page/profile_page.dart';
import 'package:get/get.dart';

import '../../../models/movie_model/movie_model.dart';
import '../../../service/fetch_api.dart';

class HomeController extends GetxController {
  // Membuat obx untuk daftar film yang akan datang
  var upcomingMovies = <Result>[].obs;
  RxInt currentIndex = 0.obs;
  RxList <Widget> bottomNav = [
    HomePageView(),
    SearchPage(),
    ProfilePage(),
  ].obs;

  @override
  void onInit() {
   super.onInit();
    // Ambil daftar film yang akan datang ketika controller diinisialisasi
    fetchUpcomingMovies();
    currentIndex.value = 0;
  }

  Future<void> fetchUpcomingMovies() async {
    final results = await Api().getUpcomingMovies();
    if (results != null) {
      upcomingMovies.assignAll(results);
    }
  }
}