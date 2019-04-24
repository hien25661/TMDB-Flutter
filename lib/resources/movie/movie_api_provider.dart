import 'dart:async';

import 'package:http/http.dart' show Client;
import 'package:flutter_tmdb/models/movie.dart';
import 'package:flutter_tmdb/resources/app_constant.dart';
import 'dart:convert';

class MovieApiProvider {
  Client client = new Client();

  //Fetch list movie now playing
  Future<MovieResponse> fetchMovieListNowPlaying() async{
    final response =await client.get(nowPlayingApi);
    if(response.statusCode == 200){
      return MovieResponse.fromJson(json.decode(response.body));
    }else {
      throw Exception("Failed to get data");
    }
  }

  //Fetch list movie now playing
  Future<MovieResponse> fetchMovieListPopular() async {
    final response = await client.get(popularApi);
    if(response.statusCode == 200){
      return MovieResponse.fromJson(json.decode(response.body));
    }else {
      throw Exception("Failed to get data");
    }
  }

  //Fetch list movie Upcoming
  Future<MovieResponse> fetchMovieListUpComing() async {
    final response = await client.get(upComingApi);
    if(response.statusCode == 200){
      return MovieResponse.fromJson(json.decode(response.body));
    }else {
      throw Exception("Failed to get data");
    }
  }

  //Fetch list movie Top Rated
  Future<MovieResponse> fetchMovieListTopRated() async {
    final response = await client.get(topRatedApi);
    if(response.statusCode == 200){
      return MovieResponse.fromJson(json.decode(response.body));
    }else {
      throw Exception("Failed to get data");
    }
  }

  Future<MovieImageResponse> fetchMovieImageList(int movieId) async {
    final response = await client.get(movieImageApi(movieId));
    if(response.statusCode == 200){
      return MovieImageResponse.fromJson(json.decode(response.body));
    }else {
      throw Exception("Failed to get data");
    }
  }


}
