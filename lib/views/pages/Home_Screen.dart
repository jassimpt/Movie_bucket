import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/constants/api_constants.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/services/apiservice.dart';
import 'package:netflix_clone/views/widgets/card_headings.dart';
import 'package:netflix_clone/views/widgets/movie_cards.dart';
import 'package:netflix_clone/views/widgets/movie_carousal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<MovieModel>> trendingmovies;
  late Future<List<MovieModel>> topratedmovies;
  late Future<List<MovieModel>> upcomingmovies;
  late Future<List<MovieModel>> populartvshows;
  late Future<List<MovieModel>> topratedtv;

  @override
  void initState() {
    // TODO: implement initState
    trendingmovies = ApiService().getMovies(url: ApiConstants().trendingurl);
    topratedmovies = ApiService().getMovies(url: ApiConstants().topratedurl);
    upcomingmovies = ApiService().getMovies(url: ApiConstants().upcomingurl);
    populartvshows =
        ApiService().getMovies(url: ApiConstants().populartvshowsurl);
    topratedtv = ApiService().getMovies(url: ApiConstants().topratedtvurl);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    'Welcome back',
                    style: GoogleFonts.poppins(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Hero',
                    style: GoogleFonts.poppins(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CardHeadings(heading: 'Trending Movies', left: 20, top: 0),
                SizedBox(
                  child: FutureBuilder(
                      future: trendingmovies,
                      builder: (context, trendingsnapshot) {
                        if (trendingsnapshot.hasError) {
                          return Center(
                            child: Text(trendingsnapshot.error.toString()),
                          );
                        } else if (trendingsnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return MovieCarousal(
                            size: size,
                            snapshot: trendingsnapshot,
                          );
                        }
                      }),
                ),
                CardHeadings(heading: 'Top Rated', left: 20, top: 10),
                SizedBox(
                  child: FutureBuilder(
                    future: topratedmovies,
                    builder: (context, topratedsnapshot) {
                      if (topratedsnapshot.hasData) {
                        return MovieCards(
                          size: size,
                          snapshot: topratedsnapshot,
                        );
                      } else if (topratedsnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Text('Error');
                      }
                    },
                  ),
                ),
                CardHeadings(left: 20, top: 20, heading: 'Upcoming Movies'),
                SizedBox(
                  child: FutureBuilder(
                    future: upcomingmovies,
                    builder: (context, upcomingsnapshot) {
                      if (upcomingsnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (upcomingsnapshot.hasData) {
                        return MovieCards(
                            snapshot: upcomingsnapshot, size: size);
                      } else {
                        return Text('Error');
                      }
                    },
                  ),
                ),
                CardHeadings(heading: 'Popular Tv Shows', left: 20, top: 20),
                SizedBox(
                  child: FutureBuilder(
                    future: populartvshows,
                    builder: (context, tvsnapshot) {
                      if (tvsnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (tvsnapshot.hasData) {
                        return MovieCards(snapshot: tvsnapshot, size: size);
                      } else {
                        return Text('Data Error');
                      }
                    },
                  ),
                ),
                CardHeadings(heading: 'Trending Tv Shows', left: 20, top: 20),
                SizedBox(
                  child: FutureBuilder(
                    future: topratedtv,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasData) {
                        return MovieCards(snapshot: snapshot, size: size);
                      } else {
                        return Text('ERror');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
