class TvResponse {
  int _page;
  int _total_results;
  int _total_pages;
  List<Tv> _results = [];

  TvResponse.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _total_results = parsedJson['total_results'];
    _total_pages = parsedJson['total_pages'];
    List<Tv> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      Tv result = Tv(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<Tv> get results => _results;

  int get total_pages => _total_pages;

  int get total_results => _total_results;

  int get page => _page;
}


class Tv {
  int _vote_count;
  int _id;
  bool _video;
  var _vote_average;
  String _name;
  double _popularity;
  String _poster_path;
  String _original_language;
  String _original_name;
  List<int> _genre_ids = [];
  String _backdrop_path;
  bool _adult;
  String _overview;
  String _release_date;

  String _first_air_today;


  Tv(result) {
    _vote_count = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
    _vote_average = result['vote_average'];
    _name = result['name'];
    _popularity = result['popularity'];
    _poster_path = result['poster_path'];
    _original_language = result['original_language'];
    _original_name = result['original_name'];
    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genre_ids.add(result['genre_ids'][i]);
    }
    _backdrop_path = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _release_date = result['release_date'];
    _first_air_today = result['first_air_today'];
  }

  String get release_date => _release_date;

  String get overview => _overview;

  bool get adult => _adult;

  String get backdrop_path => _backdrop_path;

  List<int> get genre_ids => _genre_ids;

  String get original_name => _original_name;

  String get original_language => _original_language;

  String get poster_path => _poster_path;

  double get popularity => _popularity;

  String get name => _name;

  get vote_average => _vote_average;

  bool get video => _video;

  int get id => _id;

  int get vote_count => _vote_count;
}