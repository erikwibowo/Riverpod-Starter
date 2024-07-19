import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_starter/models/movie_model.dart';

final movieProvider = StateNotifierProvider<MovieNotifier, List<Movie>>((ref) {
  return MovieNotifier();
});

class MovieNotifier extends StateNotifier<List<Movie>> {
  MovieNotifier() : super([]) {
    fetchMovies();
  }

  int _currentPage = 1;
  bool _hasMore = true;
  bool _isLoading = false;

  bool get hasMore => _hasMore;
  bool get isLoading => _isLoading;

  Future<void> fetchMovies() async {
    if (_isLoading || !_hasMore) return;
    _isLoading = _currentPage == 1 ? true : false;

    try {
      final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=$_currentPage'),
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0OWE1NDUwOTNiNWE3ODQ5ODc3YzE2OWFiNjAwNzUxNSIsIm5iZiI6MTcyMTM3MjU4OS4xODczNTUsInN1YiI6IjViZTUzOWYzYzNhMzY4MTBkMjAzZGYzNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ijCkX0NChzfed5_fWdQGkfaLQlZrB4x9NPA6A4T_Q_E',
          'accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final List result = responseBody['results'];
        final List<Movie> newMovies =
            result.map((e) => Movie.fromJson(e)).toList();

        if (newMovies.isEmpty) {
          _hasMore = false;
        } else {
          state = [...state, ...newMovies];
          _currentPage++;
        }
      } else {
        throw Exception("Failed to load : ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error loading : $e");
    } finally {
      _isLoading = false;
    }
  }
}
