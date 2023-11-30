import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/constants/api_constants.dart';
import 'package:netflix_clone/services/apiservice.dart';

class DetailsScreen extends StatelessWidget {
  String date;
  dynamic moviedata;
  DetailsScreen({super.key, required this.moviedata, required this.date});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // String date = moviedata.release_date;
    DateTime releasedate = DateTime.parse(date);
    String formateddate = DateFormat('yyyy').format(releasedate);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 24, 24),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.52,
              child: Stack(
                children: [
                  Container(
                    width: size.width,
                    height: size.height * 0.4,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "${ApiConstants().posterurl}${moviedata.backdrop_path}"),
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    top: 270,
                    child: Container(
                      width: size.width,
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.1, 0.3, 0.5, 0.7, 0.9],
                          colors: [
                            const Color.fromARGB(255, 24, 24, 24)
                                .withOpacity(0.01),
                            const Color.fromARGB(255, 24, 24, 24)
                                .withOpacity(0.3),
                            const Color.fromARGB(255, 24, 24, 24)
                                .withOpacity(0.6),
                            const Color.fromARGB(255, 24, 24, 24)
                                .withOpacity(0.9),
                            const Color.fromARGB(255, 24, 24, 24)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 260,
                    left: 20,
                    child: Container(
                      width: size.width * 0.35,
                      height: size.height * 0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.amber,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${ApiConstants().posterurl}${moviedata.poster_path}"),
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Positioned(
                    top: 330,
                    right: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width * 0.5,
                          child: Text(
                            "${moviedata.title} (${formateddate})",
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        RatingBarIndicator(
                          rating: moviedata.vote_average! / 2,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.redAccent,
                          ),
                          itemCount: 5,
                          itemSize: 20,
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Overview',
                    style: GoogleFonts.poppins(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: size.width,
                    child: Text(
                      moviedata.overview,
                      style: GoogleFonts.poppins(fontSize: 17),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Cast',
                    style: GoogleFonts.poppins(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: size.height * .25,
                    child: FutureBuilder(
                        future: ApiService().getcasts(id: moviedata.id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasData) {
                            return ListView.builder(
                                itemCount: snapshot.data!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final castdata = snapshot.data![index];
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 5, left: 8, right: 8),
                                        child: Container(
                                          height: size.height * .2,
                                          width: size.width * .25,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "${ApiConstants().posterurl}${castdata.profile_path}"),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                      Text(
                                        castdata.name!,
                                        style:
                                            GoogleFonts.poppins(fontSize: 13),
                                      )
                                    ],
                                  );
                                });
                          } else {
                            return const Text('Error');
                          }
                        }),
                  ),
                  Text(
                    'Similar movies',
                    style: GoogleFonts.poppins(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: size.height * .25,
                    child: FutureBuilder(
                        future: ApiService().getSimilarMovies(
                            similarurl:
                                "${ApiConstants().basesimilarurlmovie}${moviedata.id}${ApiConstants().endpoint}"),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasData) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 5, left: 8, right: 8),
                                    child: Container(
                                      height: size.height * .2,
                                      width: size.width * .35,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "${ApiConstants().posterurl}${snapshot.data![index].poster_path}"),
                                              fit: BoxFit.cover)),
                                    ),
                                  );
                                });
                          } else {
                            return Text('ERror');
                          }
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
