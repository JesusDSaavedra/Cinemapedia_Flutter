import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');
final searcherdMoviesProvider =
    StateNotifierProvider<SearchedMovieNotifier, List<Movie>>((ref) {
      final searchMovies = ref.read(movieRepositoryProvider).searchMovies;

      return SearchedMovieNotifier(ref: ref, searchMovies: searchMovies);
    });

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchedMovieNotifier extends StateNotifier<List<Movie>> {
  final SearchMoviesCallback searchMovies;
  final Ref ref;

  SearchedMovieNotifier({required this.ref, required this.searchMovies})
    : super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);

    state = movies;
    return movies;
  }
}
