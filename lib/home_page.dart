import 'package:flutter/material.dart';
import 'movie_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  final List<Movie> movies = [
    Movie(name: "Tangled", releaseYear: 2010, rating: 7.8, posterUrl: 'assets/images/tangled.jpg'),
    Movie(name: "Moana", releaseYear: 2016, rating: 7.6, posterUrl: 'assets/images/moana.jpg'),
    Movie(name: "Up", releaseYear: 2009, rating: 8.2, posterUrl: 'assets/images/up.jpg'),
    Movie(name: "Coco", releaseYear: 2017, rating: 8.4, posterUrl: 'assets/images/coco.jpg'),
    Movie(name: "Toy Story", releaseYear: 1995, rating: 8.3, posterUrl: 'assets/images/toystory.jpg'),
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.movie, color: Colors.indigo[600],),
            SizedBox(width: 10,),
            Text('Favourite Movies', 
              style: TextStyle(color: Colors.indigo[600], fontWeight: FontWeight.bold),),
          ],
        ),
        ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.5, 
        width: MediaQuery.of(context).size.width,
        child: CarouselSlider.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return _buildMovieCarrousel(movies[index]);
          },
          options: CarouselOptions(
            height: 300.0,
            // aspectRatio: 16/9,
            viewportFraction: 0.50,
            enlargeCenterPage: true,
            enlargeFactor: 0.2          
          ),
        ),
        ),
        
      );
  }
}

Widget _buildMovieCarrousel(Movie movie){
  return Container(
    width: 300,
    margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 200, 
            width: 150,
            padding: EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)), 
              child: Image.asset(
                movie.posterUrl, 
                fit: BoxFit.cover,
              )
              )
          ),
          Column( 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                movie.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Text(
                "Release year: ${movie.releaseYear}",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Text(
                "Rating: ${movie.rating}",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          )
          ]
      )    
      );


Widget _buildMovieCard(Movie movie) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        height: 100,
        child: Row(
          children: [
            Image.asset(
              movie.posterUrl,
              height: 100,
              width: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,  
                children: [
                  Text(
                    movie.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Release year: ${movie.releaseYear}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    movie.rating.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
}}
