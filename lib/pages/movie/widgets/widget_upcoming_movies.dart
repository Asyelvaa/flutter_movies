import 'package:flutter/material.dart';
import 'package:flutter_movies/models/movie_model/movie_model.dart';
import 'package:flutter_movies/pages/movie/home_page/home_controller.dart';
import 'package:flutter_movies/service/fetch_api.dart';
import 'package:get/get.dart';

class UpcomingMoviesWidget extends StatelessWidget {

  UpcomingMoviesWidget({super.key, required this.snapshot});
  final HomeController controller = Get.put(HomeController());
  final AsyncSnapshot snapshot;
  
  @override
  Widget build(BuildContext context) {
    return Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed('/detailMoviePage', arguments: snapshot.data[index]);
                  },
                  child : MovieListItem(movie: snapshot.data![index])
                );
              },
              ),
          );
        
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