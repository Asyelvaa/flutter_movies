import 'package:flutter/material.dart';
import 'package:flutter_movies/models/movie_model/movie_model.dart';
import 'package:flutter_movies/service/fetch_api.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

late Future<List<Result>> popularMovies;
late Future<List<Result>> UpcomingMovies;

class _MoviePageState extends State<MoviePage> {

  @override
  void initState() {
    super.initState();
    popularMovies = Api().getPopularMovies();
    UpcomingMovies = Api().getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Popular Movies',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],)
      ),
    );
      
  }
}