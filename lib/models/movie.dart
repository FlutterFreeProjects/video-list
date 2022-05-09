import 'package:flickd_app/models/app_config.dart';
import 'package:get_it/get_it.dart';

class Movie {
  final String name;
  final String language;
  final bool isAdult;
  final String decription;
  final String posterPath;
  final String backdropPath;
  final num rating;
  final String releaseDate;

  Movie(this.name, this.language, this.isAdult, this.decription,
      this.posterPath, this.backdropPath, this.rating, this.releaseDate);

  factory Movie.fromJson(Map<String, dynamic> _json) {
    return Movie(
        _json['title'],
        _json['original_language'],
        _json['adult'],
        _json['overview'],
        _json['poster_path'],
        _json['backdrop_path'],
        _json['vote_average'],
        _json['release_date']);
  }

  String posterURL() {
    final AppConfig _appConfig = GetIt.instance.get<AppConfig>();
    return '${_appConfig.BASE_IMAGE_API_URL}$posterPath';
  }
}
