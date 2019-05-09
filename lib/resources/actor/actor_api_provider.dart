
import 'dart:async';
import 'package:flutter_tmdb/resources/app_constant.dart';
import 'package:flutter_tmdb/models/actor.dart';
import 'package:dio/dio.dart';

class ActorApiProvider {
  Dio dio = new Dio();

  //Fetch Actor Popular
  Future<ActorResponse> fetchActorPopular() async{
    final response =await dio.get(actorPopularApi);
    if(response.statusCode == 200){
      return ActorResponse.fromJson(response.data);
    }else {
      throw Exception("Failed to get data");
    }
  }
}