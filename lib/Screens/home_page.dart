import 'package:flutter/material.dart';
import 'package:flutter_movies/Model/movie_model.dart';
import 'package:flutter_movies/Widget/widget_popular_movies.dart';
import 'package:flutter_movies/Widget/widget_upcoming_movies.dart';
import '../Services/fetch_api.dart';

class HomePage extends StatelessWidget {
  final String? apiKey;
  HomePage({Key? key, this.apiKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Result>>(
      future: Api().getUpcomingMovies(), 
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'Upcoming Movies',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    UpcomingMoviesWIdget(snapshot: snapshot),
                  ],
                )
                ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          return Center(child: const CircularProgressIndicator());
        }
      }
    );
  }
}



//  FutureBuilder<List<Result>>(
//           future: Api().getPopularMovies(), 
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return Scaffold(
//                 body: SafeArea(
//                   child: Center(
//                     child: Column(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.symmetric(vertical: 15),
//                           child: Text(
//                             'Popular Movies',
//                             style: const TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         PopularMoviesWidget(snapshot: snapshot),
//                       ],
//                     )
//                     ),
//                 ),
//               );
//             } else if (snapshot.hasError) {
//               return Text('${snapshot.error}');
//             } else {
//               return Center(child: const CircularProgressIndicator());
//             }
//           }
//         ),