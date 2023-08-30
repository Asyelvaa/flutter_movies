import 'package:flutter/material.dart';
import 'package:flutter_movies/Model/movie_model.dart';
import 'package:flutter_movies/Screens/detail_page.dart';
import 'package:flutter_movies/Services/fetch_api.dart';

class UpcomingMoviesWIdget extends StatelessWidget {
  const UpcomingMoviesWIdget({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Api().getUpcomingMovies(), 
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                    builder: (context) => DetailMoviePage(movie: snapshot.data![index])
                    ));
                  },
                  child : MovieListItem(movie: snapshot.data![index])
                );
              },
              ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error'),);
        } else {
          return Center(child: CircularProgressIndicator(),);
        }
    });
  }
}

class MovieListItem extends StatelessWidget {
  final Result movie;
  const MovieListItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                '${App.imageUrl}${movie.posterPath}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}