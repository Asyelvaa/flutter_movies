import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_movies/models/movie_model/movie_model.dart';

class App {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey= '830dd38e58acd49964ad520461d7a6f8';
  static const String imageUrl = 'https://image.tmdb.org/t/p/w500';
}

class Api {
  static const _popularUrl = '${App.baseUrl}/trending/movie/day?api_key=${App.apiKey}';
  static const _upcomingUrl = '${App.baseUrl}/movie/upcoming?api_key=${App.apiKey}';

  Future<List<Result>> getPopularMovies() async {
    final response = await http.get(Uri.parse(_popularUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((json) => Result.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Result>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upcomingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((json) => Result.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }


}