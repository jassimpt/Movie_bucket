import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/views/widgets/movie_cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  padding: const EdgeInsets.only(left: 20, top: 20),
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
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Trending Movies',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  child: CarouselSlider.builder(
                      itemCount: 10,
                      options: CarouselOptions(
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        height: size.height * 0.28,
                        autoPlay: true,
                      ),
                      itemBuilder: (context, itemindex, pageindex) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 20, bottom: 10),
                          child: Stack(
                            children: [
                              Container(
                                width: size.width,
                                decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    'Top Rated',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                MovieCards(size: size),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    'Upcoming Movies',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                MovieCards(size: size),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
