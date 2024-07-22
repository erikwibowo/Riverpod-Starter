import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/models/movie_model.dart';
import 'package:riverpod_starter/services/movie_service.dart';

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
      final newMovies = await MovieService().fetchMovies(_currentPage);

      if (newMovies.isEmpty) {
        _hasMore = false;
      } else {
        state = [...state, ...newMovies];
        _currentPage++;
      }
    } catch (e) {
      throw Exception("Error loading : $e");
    } finally {
      _isLoading = false;
    }
  }
}
