
import 'dart:async';
import 'dart:convert';
import 'package:flutter_tmdb/resources/app_constant.dart';
import 'package:http/http.dart';
import 'package:flutter_tmdb/models/actor.dart';

class ActorApiProvider {
  Client client = new Client();

  //Fetch Actor Popular
  Future<ActorResponse> fetchActorPopular() async{
    final response =await client.get(nowPlayingApi);
    if(response.statusCode == 200){
      return ActorResponse.fromJson(json.decode(response.body));
    }else {
      throw Exception("Failed to get data");
    }
  }
}