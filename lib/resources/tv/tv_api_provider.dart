import 'dart:async';
import 'package:dio/dio.dart';
import 'package:http/http.dart' show Client;
import 'package:flutter_tmdb/models/tv.dart';
import 'package:flutter_tmdb/resources/app_constant.dart';
import 'dart:convert';

class TVApiProvider {
  Dio client = new Dio();

  //Fetch list tv airing today
  Future<TvResponse> fetchTVShowListAiringToday() async{
    final response =await client.get(tvAiringTodayApi);
    if(response.statusCode == 200){
      return TvResponse.fromJson(response.data);
    }else {
      throw Exception("Failed to get data");
    }
  }

  //Fetch list tv on the air
  Future<TvResponse> fetchTVShowListOnTheAir() async{
    final response =await client.get(tvOnTheAirApi);
    if(response.statusCode == 200){
      return TvResponse.fromJson(response.data);
    }else {
      throw Exception("Failed to get data");
    }
  }

  //Fetch list tv popular
  Future<TvResponse> fetchTVShowListPopular() async{
    final response =await client.get(tvPopularApi);
    if(response.statusCode == 200){
      return TvResponse.fromJson(response.data);
    }else {
      throw Exception("Failed to get data");
    }
  }

  //Fetch list tv top rated
  Future<TvResponse> fetchTVShowListTopRated() async{
    final response =await client.get(tvTopRatedApi);
    if(response.statusCode == 200){
      return TvResponse.fromJson(response.data);
    }else {
      throw Exception("Failed to get data");
    }
  }



}
