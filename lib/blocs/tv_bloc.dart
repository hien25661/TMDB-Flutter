import 'package:flutter_tmdb/models/tv.dart';
import 'package:flutter_tmdb/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class TVBloc {
  final _repository = new Repository();
  final _tvShowFetcher = PublishSubject<TvResponse>();

  Observable<TvResponse> get tvShowList => _tvShowFetcher.stream;


  fetchAllTvAiringToday() async {
    TvResponse tvResponse = await _repository.fetchTVShowListAiringToday();
    _tvShowFetcher.sink.add(tvResponse);
  }

  fetchAllTvOnTheAir() async {
    TvResponse tvResponse = await _repository.fetchTVShowListOnTheAir();
    _tvShowFetcher.sink.add(tvResponse);
  }

  fetchAllTvPopular() async {
    TvResponse tvResponse = await _repository.fetchTVShowListPopular();
    _tvShowFetcher.sink.add(tvResponse);
  }

  fetchAllTvTopRated() async {
    TvResponse tvResponse = await _repository.fetchTVShowListTopRated();
    _tvShowFetcher.sink.add(tvResponse);
  }


  dispose(){
    _tvShowFetcher.close();
  }

}

TVBloc tvBloc = new TVBloc();