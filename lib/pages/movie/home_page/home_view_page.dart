import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../service/fetch_api.dart';
import '../widgets/widget_upcoming_movies.dart';
import 'home_controller.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  'Upcoming Movies',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
              child: GetBuilder<HomeController>(builder: (controller) {
                return FutureBuilder(
                  future: Api().getUpcomingMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return UpcomingMoviesWidget(
                        snapshot: snapshot,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                );
              }),
            ),
            ],
          ),
          
        )
      ),
    );
  }
}