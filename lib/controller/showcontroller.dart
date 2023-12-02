import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/api_constants.dart';
import 'package:netflix_clone/models/cast_model.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/services/apiservice.dart';

class ShowController extends ChangeNotifier {
  late Future<List<MovieModel>> trendingmovies;
  late Future<List<MovieModel>> topratedmovies;
  late Future<List<MovieModel>> upcomingmovies;
  late Future<List<MovieModel>> populartvshows;
  late Future<List<MovieModel>> topratedtv;
  late Future<List<MovieModel>> trendingtv;
  late Future<List<MovieModel>> airingtv;

  ShowController() {
    fetchTopRatedTv();
    fetchTrendingTv();
    fetchAiringTv();
    fetchTrendingMovies();
    fetchTopratedMovies();
    fetchUpcomingMovies();
    fetchPopularTv();
  }

  fetchTrendingMovies() async {
    try {
      trendingmovies = ApiService().getMovies(url: ApiConstants().trendingurl);
    } catch (e) {
      throw Exception(e);
    }
  }

  fetchTopratedMovies() async {
    try {
      topratedmovies = ApiService().getMovies(url: ApiConstants().topratedurl);
    } catch (e) {
      throw Exception(e);
    }
  }

  fetchUpcomingMovies() async {
    try {
      upcomingmovies = ApiService().getMovies(url: ApiConstants().upcomingurl);
    } catch (e) {
      throw Exception(e);
    }
  }

  fetchPopularTv() async {
    try {
      populartvshows =
          ApiService().getMovies(url: ApiConstants().populartvshowsurl);
    } catch (e) {
      throw Exception(e);
    }
  }

  fetchTopRatedTv() async {
    try {
      topratedtv = ApiService().getMovies(url: ApiConstants().topratedtvurl);
    } catch (e) {
      throw Exception(e);
    }
  }

  fetchTrendingTv() async {
    try {
      trendingtv = ApiService().getMovies(url: ApiConstants().trendingtvurl);
    } catch (e) {
      throw Exception(e);
    }
  }

  fetchAiringTv() async {
    try {
      airingtv = ApiService().getMovies(url: ApiConstants().airingtodaturl);
    } catch (e) {
      throw Exception(e);
    }
  }
}
