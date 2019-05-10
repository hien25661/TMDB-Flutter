import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_tmdb/models/movie.dart';
import 'package:flutter_tmdb/resources/app_constant.dart';

class MovieApiProvider {
  Dio dio = new Dio();

  //Fetch list movie now playing
  Future<MovieResponse> fetchMovieListNowPlaying() async{
    final response =await dio.get(nowPlayingApi);
    if(response.statusCode == 200){
      return MovieResponse.fromJson(response.data);
    }else {
      throw Exception("Failed to get data");
    }
  }

  //Fetch list movie now playing
  Future<MovieResponse> fetchMovieListPopular() async {
    final response = await dio.get(popularApi);
    if(response.statusCode == 200){
      return MovieResponse.fromJson(response.data);
    }else {
      throw Exception("Failed to get data");
    }
  }

  //Fetch list movie Upcoming
  Future<MovieResponse> fetchMovieListUpComing() async {
    final response = await dio.get(upComingApi);
    if(response.statusCode == 200){
      return MovieResponse.fromJson(response.data);
    }else {
      throw Exception("Failed to get data");
    }
  }

  //Fetch list movie Top Rated
  Future<MovieResponse> fetchMovieListTopRated() async {
    final response = await dio.get(topRatedApi);
    if(response.statusCode == 200){
      return MovieResponse.fromJson(response.data);
    }else {
      throw Exception("Failed to get data");
    }
  }

  //Fetch list Image movie
  Future<MovieImageResponse> fetchMovieImageList(int movieId) async {
    final response = await dio.get(movieImageApi(movieId));
    if(response.statusCode == 200){
      return MovieImageResponse.fromJson(response.data);
    }else {
      throw Exception("Failed to get data");
    }
  }


}
