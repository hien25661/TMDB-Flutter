
import 'dart:async';

import 'package:flutter_tmdb/resources/movie/movie_api_provider.dart';
import 'tv/tv_api_provider.dart';
import 'actor/actor_api_provider.dart';
import 'package:flutter_tmdb/models/movie.dart';
import 'package:flutter_tmdb/models/tv.dart';
import 'package:flutter_tmdb/models/actor.dart';

class Repository {

  //Movie
  MovieApiProvider movieApiProvider = new MovieApiProvider();

  Future<MovieResponse> fetchMovieListNowPlaying()=> movieApiProvider.fetchMovieListNowPlaying();
  Future<MovieResponse> fetchMovieListPopular()=> movieApiProvider.fetchMovieListPopular();
  Future<MovieResponse> fetchMovieListUpComing()=> movieApiProvider.fetchMovieListUpComing();
  Future<MovieResponse> fetchMovieListTopRated()=> movieApiProvider.fetchMovieListTopRated();

  Future<MovieImageResponse> fetchMovieImages(int movieId)=> movieApiProvider.fetchMovieImageList(movieId);


  //TV
  TVApiProvider tvApiProvider = new TVApiProvider();

  Future<TvResponse> fetchTVShowListAiringToday()=> tvApiProvider.fetchTVShowListAiringToday();
  Future<TvResponse> fetchTVShowListOnTheAir()=> tvApiProvider.fetchTVShowListOnTheAir();
  Future<TvResponse> fetchTVShowListPopular()=> tvApiProvider.fetchTVShowListPopular();
  Future<TvResponse> fetchTVShowListTopRated()=> tvApiProvider.fetchTVShowListTopRated();

  //Actor
  ActorApiProvider actorApiProvider = new ActorApiProvider();

  Future<ActorResponse> fetchActorPopular()=>actorApiProvider.fetchActorPopular();


}