import 'package:flutter/material.dart';
import 'package:flutter_movies/models/movie_model/movie_model.dart';
import 'package:get/get.dart';
import '../../../service/fetch_api.dart';

class DetailMoviePage extends StatelessWidget {

  DetailMoviePage({super.key,});
  Result movie = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            // BACKDROPPATH
            Stack(
              children: [Container(
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('${App.imageUrl}${movie.backdropPath}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              ],
            ),
            Row(
              children: [
                // TITLE
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    child: Text(
                      '${movie.title}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // RATING
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber,),
                      Text(
                        '${movie.voteAverage}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // RELEASE DATE
            
            // OVERVIEW
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overview',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    '${movie.overview}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
            
          ]),
        ),
      ),
    );
  }
}