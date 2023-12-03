import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/services/apiservice.dart';

class SearchProvider extends ChangeNotifier {
  final TextEditingController queryController = TextEditingController();
  final ApiService apiService = ApiService();
  List<MovieModel> searchResults = [];
  void searchMovies(String query) async {
    
    if (query.isNotEmpty) {
      try {
        final searchUrl =
            "https://api.themoviedb.org/3/search/movie?query=$query&api_key=62993259b09bd60f498f3221ef24fe9c";
        List<MovieModel> movies =
            await apiService.searchMovies(searchurl: searchUrl);

        searchResults = movies;
        notifyListeners();
      } catch (e) {
        print("Error: $e");
      }
    } else {
      searchResults = [];
      notifyListeners();
    }
  }
}
