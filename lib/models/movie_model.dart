class MovieModel {
  int? id;
  String? title;
  String? original_title;
  String? backdrop_path;
  String? original_language;
  String? overview;
  String? poster_path;
  String? release_date;
  double? vote_average;
  String? name;
  String? original_name;
  String? first_air_date;

  MovieModel({
    required this.first_air_date,
    required this.name,
    required this.original_name,
    required this.id,
    required this.title,
    required this.original_title,
    required this.backdrop_path,
    required this.original_language,
    required this.overview,
    required this.poster_path,
    required this.release_date,
    required this.vote_average,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        first_air_date: json["first_air_date"] ?? "nodata",
        original_name: json["original_name"] ?? "nodata",
        name: json["name"] ?? "nodata",
        id: json["id"] ?? "no data",
        title: json["title"] ?? "no data",
        original_title: json["original_title"] ?? "no data",
        backdrop_path: json["backdrop_path"] ?? "no data",
        original_language: json["original_language"] ?? "no data",
        overview: json["overview"] ?? "no data",
        poster_path: json["poster_path"] ?? "no data",
        release_date: json["release_date"] ?? "no data",
        vote_average: json["vote_average"] ?? "no data");
  }
}
