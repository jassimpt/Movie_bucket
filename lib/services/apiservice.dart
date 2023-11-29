import 'dart:convert';

import 'package:netflix_clone/models/movie_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio();

  Future<List<MovieModel>> getMovies({required url}) async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> respdata = response.data;
        final List<dynamic> results = respdata["results"];
        print(respdata);
        return results.map((movie) => MovieModel.fromJson(movie)).toList();
      } else {
        throw Exception("function error ");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
