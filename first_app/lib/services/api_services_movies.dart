import 'dart:convert';
import 'dart:developer';

import 'package:first_app/model/response_list_movies.dart';
import 'package:http/http.dart' as http;

class ApiServicesMovies {
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String bearerToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNDhmMmM5ODk3YjhmMTZiODEzYTZiMzcyY2EzYjgyMyIsIm5iZiI6MTY0Njg5NTg3OC43MDEsInN1YiI6IjYyMjlhMzA2OWEzYzQ5MDAxZDEzZmRiYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.D-_DMs2rKKviCWgCHoh4tSC4Tx5mEX3oKd3x_ktbhB4';

  Future<ResponseListTrendingMovies> getTrendingMovies() async {
    try {
      final response = await http.get(
          Uri.parse('$baseUrl/trending/movie/day?language=en-US'),
          headers: {
            'Authorization': 'Bearer $bearerToken',
            'accept': 'application/json'
          });
      if (response.statusCode == 200) {
        return ResponseListTrendingMovies.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load trending movies');
      }
    } catch (e) {
      return throw Exception(e.toString());
    }
  }
}
