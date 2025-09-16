import 'dart:developer';

import 'package:first_app/constants/states.dart';
import 'package:first_app/model/response_list_movies.dart';
import 'package:first_app/services/api_services_movies.dart';
import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier {
  final ApiServicesMovies apiServicesMovies = ApiServicesMovies();

  String? _errorMessage;
  ResultState? _state;
  ResponseListTrendingMovies? _respTrendingMovies;

  String? get errorMessage => _errorMessage;
  ResultState? get state => _state;
  ResponseListTrendingMovies? get respTrendingMovies => _respTrendingMovies;

  Future<void> getListTrendingMovies() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final response = await apiServicesMovies.getTrendingMovies();
      _respTrendingMovies = response;
      _state = ResultState.HasData;
    } catch (e) {
      _errorMessage = e.toString();
      _state = ResultState.Error;
    }
    notifyListeners();
  }
}
