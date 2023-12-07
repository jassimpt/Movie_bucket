import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:netflix_clone/constants/api_constants.dart';
import 'package:netflix_clone/controller/search_provider.dart';
import 'package:netflix_clone/views/pages/details_screen.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchcontroller = Provider.of<SearchProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      searchcontroller.searchMovies(value);
                    },
                    controller: searchcontroller.queryController,
                    decoration: InputDecoration(
                      hintText: 'Search Movies',
                      prefixIcon: const Icon(Iconsax.search_favorite),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height,
                  child: searchcontroller.searchResults.isEmpty
                      ? const Center(
                          child: Text('Search Anything'),
                        )
                      : GridView.builder(
                          itemCount: searchcontroller.searchResults.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  crossAxisCount: 3,
                                  childAspectRatio: 1 / 1.4),
                          itemBuilder: (context, index) {
                            final searchdata =
                                searchcontroller.searchResults[index];

                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                        type: "movie/",
                                        name: searchdata.title!,
                                        data: searchdata,
                                        date: searchdata.release_date,
                                        casturl:
                                            "${ApiConstants().base}movie/${searchdata.id}${ApiConstants().castend}")));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${ApiConstants().posterurl}${searchdata.poster_path}"),
                                        fit: BoxFit.fill,
                                        filterQuality: FilterQuality.high),
                                    color: Colors.black.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            );
                          }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
