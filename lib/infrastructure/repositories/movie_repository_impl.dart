import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;

  MoviesRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaiying({int page = 1}) =>
      datasource.getNowPlaying(page: page);

  @override
  Future<List<Movie>> getPopular({int page = 1}) =>
      datasource.getPopular(page: page);

  @override
  Future<List<Movie>> getTopRated({int page = 1}) =>
      datasource.getTopRated(page: page);

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) =>
      datasource.getUpcoming(page: page);

  @override
  Future<Movie> getMovieById(String id) => datasource.getMovieById(id);

  @override
  Future<List<Movie>> searchMovies(String query) =>
      datasource.searchMovies(query);
}
