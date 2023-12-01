import 'dart:convert';

import 'package:netflix_clone/constants/api_constants.dart';
import 'package:netflix_clone/models/cast_model.dart';
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
        // print(respdata);
        return results.map((movie) => MovieModel.fromJson(movie)).toList();
      } else {
        throw Exception("function error ");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<CastModel>> getcasts({required casturl}) async {
    try {
      final response = await dio.get(casturl);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        final List<dynamic> results = data["cast"];
        print(results);
        return results.map((cast) => CastModel.fromJson(cast)).toList();
      } else {
        throw Exception('Error funtion');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<MovieModel>> getSimilarMovies({required similarurl}) async {
    try {
      final response = await dio.get(similarurl);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        final List<dynamic> similarmovie = data["results"];
        return similarmovie.map((movie) => MovieModel.fromJson(movie)).toList();
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<MovieModel>> searchMovies({required searchurl}) async {
    try {
      final response = await dio.get(searchurl);
      if (response.statusCode == 200) {
        final Map<String, dynamic> searchdata = response.data;
        final List<dynamic> searchmovies = searchdata["results"];
        return searchmovies
            .map((search) => MovieModel.fromJson(search))
            .toList();
      } else {
        throw Exception('function error');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
