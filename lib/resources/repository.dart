
import 'package:flutter_tmdb/resources/movie/movie_api_provider.dart';
import 'package:flutter_tmdb/models/movie.dart';

class Repository {
  MovieApiProvider movieApiProvider = new MovieApiProvider();

  Future<MovieResponse> fetchMovieListNowPlaying()=> movieApiProvider.fetchMovieListNowPlaying();
  Future<MovieResponse> fetchMovieListPopular()=> movieApiProvider.fetchMovieListPopular();
  Future<MovieResponse> fetchMovieListUpComing()=> movieApiProvider.fetchMovieListUpComing();
  Future<MovieResponse> fetchMovieListTopRated()=> movieApiProvider.fetchMovieListTopRated();

  Future<MovieImageResponse> fetchMovieImages(int movieId)=> movieApiProvider.fetchMovieImageList(movieId);
}