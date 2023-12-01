import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/services/apiservice.dart';
// Import the package for debounce

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController queryController = TextEditingController();
  final ApiService apiService = ApiService();
  List<MovieModel> searchResults = [];

  void onSearchChanged() {
    searchMovies();
  }

  void searchMovies() async {
    String query = queryController.text.trim();
    if (query.isNotEmpty) {
      try {
        final searchUrl =
            "https://api.themoviedb.org/3/search/tv?query=$query&api_key=62993259b09bd60f498f3221ef24fe9c";
        List<MovieModel> movies =
            await apiService.searchMovies(searchurl: searchUrl);
        setState(() {
          searchResults = movies;
        });
      } catch (e) {
        print("Error: $e");
        // Handle error accordingly (e.g., show error message)
      }
    } else {
      setState(() {
        searchResults = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: queryController,
                  decoration: InputDecoration(
                    hintText: 'Search Movies',
                    prefixIcon: Icon(Iconsax.search_favorite),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(searchResults[index].name!),
                      // Display other movie details as needed
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
