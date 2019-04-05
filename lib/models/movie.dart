class MovieResponse {
  int _page;
  int _total_results;
  int _total_pages;
  List<Movie> _results = [];

  MovieResponse.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _total_results = parsedJson['total_results'];
    _total_pages = parsedJson['total_pages'];
    List<Movie> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      Movie result = Movie(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<Movie> get results => _results;

  int get total_pages => _total_pages;

  int get total_results => _total_results;

  int get page => _page;
}


class Movie {
  int _vote_count;
  int _id;
  bool _video;
  var _vote_average;
  String _title;
  double _popularity;
  String _poster_path;
  String _original_language;
  String _original_title;
  List<int> _genre_ids = [];
  String _backdrop_path;
  bool _adult;
  String _overview;
  String _release_date;


  Movie(result) {
    _vote_count = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
    _vote_average = result['vote_average'];
    _title = result['title'];
    _popularity = result['popularity'];
    _poster_path = result['poster_path'];
    _original_language = result['original_language'];
    _original_title = result['original_title'];
    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genre_ids.add(result['genre_ids'][i]);
    }
    _backdrop_path = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _release_date = result['release_date'];
  }

  String get release_date => _release_date;

  String get overview => _overview;

  bool get adult => _adult;

  String get backdrop_path => _backdrop_path;

  List<int> get genre_ids => _genre_ids;

  String get original_title => _original_title;

  String get original_language => _original_language;

  String get poster_path => _poster_path;

  double get popularity => _popularity;

  String get title => _title;

  get vote_average => _vote_average;

  bool get video => _video;

  int get id => _id;

  int get vote_count => _vote_count;
}

//==============================================================================
class MovieImageResponse {
  int _id;
  List<MovieImage> _backdrops = [];
  List<MovieImage> _posters = [];

  MovieImageResponse.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    List<MovieImage> temp1 = [];
    for (int i = 0; i < parsedJson['backdrops'].length; i++) {
      MovieImage image = MovieImage(parsedJson['backdrops'][i]);
      temp1.add(image);
    }
    _backdrops = temp1;

    List<MovieImage> temp2 = [];
    for (int i = 0; i < parsedJson['posters'].length; i++) {
      MovieImage image = MovieImage(parsedJson['posters'][i]);
      temp2.add(image);
    }
    _posters = temp2;
  }

  List<MovieImage> get posters => _posters;

  List<MovieImage> get backdrops => _backdrops;

  int get id => _id;

}


class MovieImage {
  double _aspect_ratio;
  String _file_path;
  int _height;
  String _iso_639_1;
  int _vote_average;
  int _vote_count;
  int _width;

  MovieImage(parsedJson){
    _aspect_ratio = parsedJson['aspect_ratio'];
    _file_path = parsedJson['file_path'];
    _height = parsedJson['height'];
    _iso_639_1 = parsedJson['iso_639_1'];
    _vote_average = parsedJson['vote_average'];
    _vote_count = parsedJson['vote_count'];
    _width = parsedJson['width'];
  }

  int get width => _width;

  int get vote_count => _vote_count;

  int get vote_average => _vote_average;

  String get iso_639_1 => _iso_639_1;

  int get height => _height;

  String get file_path => _file_path;

  double get aspect_ratio => _aspect_ratio;


}