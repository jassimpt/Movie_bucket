import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/controller/showcontroller.dart';
import 'package:netflix_clone/views/widgets/card_headings.dart';
import 'package:netflix_clone/views/widgets/movie_cards.dart';
import 'package:netflix_clone/views/widgets/movie_carousal.dart';
import 'package:netflix_clone/views/widgets/tv_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviecontroller = Provider.of<ShowController>(context, listen: false);
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
                      future: moviecontroller.trendingmovies,
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
                CardHeadings(heading: 'Top From India', left: 20, top: 10),
                SizedBox(
                  child: FutureBuilder(
                    future: moviecontroller.topratedmovies,
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
                    future: moviecontroller.upcomingmovies,
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
                        return Text(upcomingsnapshot.error.toString());
                      }
                    },
                  ),
                ),
                CardHeadings(heading: 'Popular Tv Shows', left: 20, top: 20),
                SizedBox(
                  child: FutureBuilder(
                    future: moviecontroller.populartvshows,
                    builder: (context, tvsnapshot) {
                      if (tvsnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (tvsnapshot.hasData) {
                        return TvCard(
                          size: size,
                          snapshot: tvsnapshot,
                        );
                      } else {
                        return Text('Data Error');
                      }
                    },
                  ),
                ),
                CardHeadings(heading: 'Trending Tv Shows', left: 20, top: 20),
                SizedBox(
                  child: FutureBuilder(
                    future: moviecontroller.topratedtv,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasData) {
                        return TvCard(
                          size: size,
                          snapshot: snapshot,
                        );
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
