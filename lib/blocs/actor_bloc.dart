import 'package:flutter_tmdb/models/actor.dart';
import 'package:flutter_tmdb/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class ActorBloc {
  final _repository = new Repository();
  final _actorFetcher = PublishSubject<ActorResponse>();

  Observable<ActorResponse> get actorList => _actorFetcher.stream;


  fetchActorPopular() async {
    ActorResponse actorResponse = await _repository.fetchActorPopular();
    _actorFetcher.sink.add(actorResponse);
  }


  dispose(){
    _actorFetcher.close();
  }

}

ActorBloc actorBloc = new ActorBloc();