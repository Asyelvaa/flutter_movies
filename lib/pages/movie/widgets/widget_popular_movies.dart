import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies/models/movie_model/movie_model.dart';
import 'package:flutter_movies/pages/movie/detail_page/detail_page.dart';
import 'package:flutter_movies/service/fetch_api.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PopularMoviesWidget extends StatelessWidget {
  const PopularMoviesWidget({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
  return FutureBuilder(
  future: Api().getPopularMovies(), 
  builder: ((context, snapshot) {
    if (snapshot.hasData) {
      return CarouselSlider.builder(
        itemCount: snapshot.data!.length, 
        options: CarouselOptions(
          height: 300,
          viewportFraction: 0.5,
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 3,)
        ),
        itemBuilder: (context, index, realIndex) {
              final movie = snapshot.data![index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => DetailMoviePage(movie:movie)
                    ));
                },
                child: MovieCardCarousel(movie: movie),
              );
            }, 
      );
      } else if (snapshot.hasError) {
      return const Center(
        child: Text('Error'),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  })
  );
}
}


class MovieCardCarousel extends StatelessWidget {
  final Result movie;
  const MovieCardCarousel({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          // IMAGE
          Container(
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage('${App.imageUrl}${movie.posterPath}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // TEXT
          Padding(padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                  '${movie.title}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
              ),
              const SizedBox(height: 4),
               Text(
                  'Release Date: ${movie.releaseDate}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              const SizedBox(height: 4),
              RatingBarIndicator(
                  rating: movie.voteAverage! / 2,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
          ]),
          )
        ],
      ),
  );
  }
}
