import 'package:flutter/material.dart';
import 'package:flutter_movies/pages/movie/home_page/home_controller.dart';
import 'package:flutter_movies/pages/widget_bottom_navbar.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
       Obx(() => homeController.bottomNav[homeController.currentIndex.value]),

      bottomNavigationBar: bottomNavigationBar(),
      
    );
  }
}

// return FutureBuilder<List<Result>>(
//       future: Api().getUpcomingMovies(), 
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return Scaffold(
//             body: SafeArea(
//               child: Center(
//                 child: Column(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.symmetric(vertical: 15),
//                       child: Text(
//                         'Upcoming Movies',
//                         style: const TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     UpcomingMoviesWIdget(snapshot: snapshot),
//                   ],
//                 )
//                 ),
//             ),
//           );
//         } else if (snapshot.hasError) {
//           return Text('${snapshot.error}');
//         } else {
//           return Center(child: const CircularProgressIndicator());
//         }
//       }
//     );
//   }

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