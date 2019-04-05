import 'package:flutter_tmdb/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_tmdb/models/movie.dart';

class MovieBloc {
  final _repository = new Repository();
  final _movieFetcher = PublishSubject<MovieResponse>();

  final _movieImageFetcher = PublishSubject<MovieImageResponse>();

  Observable<MovieResponse> get movieList => _movieFetcher.stream;
  Observable<MovieImageResponse> get movieImageList => _movieImageFetcher.stream;

  fetchAllMoviesNowPlaying() async {
    MovieResponse movieResponse = await _repository.fetchMovieListNowPlaying();
    _movieFetcher.sink.add(movieResponse);
  }

  fetchAllMoviesPopular() async {
    MovieResponse movieResponse = await _repository.fetchMovieListPopular();
    _movieFetcher.sink.add(movieResponse);
  }

  fetchAllMoviesUpComing() async {
    MovieResponse movieResponse = await _repository.fetchMovieListUpComing();
    _movieFetcher.sink.add(movieResponse);
  }

  fetchAllMoviesTopRated() async {
    MovieResponse movieResponse = await _repository.fetchMovieListTopRated();
    _movieFetcher.sink.add(movieResponse);
  }

  fetchAllMoviesImages(int movieId) async {
    MovieImageResponse movieImageResponse = await _repository.fetchMovieImages(movieId);
    _movieImageFetcher.sink.add(movieImageResponse);
  }


  dispose(){
    _movieFetcher.close();
    _movieImageFetcher.close();
  }

}

MovieBloc movieBloc = new MovieBloc();