import 'package:flutter/material.dart';
import 'package:netflix_clone/controller/showcontroller.dart';
import 'package:netflix_clone/views/widgets/card_headings.dart';
import 'package:netflix_clone/views/widgets/show_grid.dart';
import 'package:provider/provider.dart';

class TvShowsScreen extends StatelessWidget {
  const TvShowsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviecontroller = Provider.of<ShowController>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardHeadings(
                heading: 'Top Rated',
                left: 20,
                top: 20,
                fontsize: 18,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: size.height * 0.45,
                  child: FutureBuilder(
                    future: moviecontroller.topratedtv,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasData) {
                        return ShowGrid(
                          size: size,
                          snapshot: snapshot,
                        );
                      } else {
                        return const Text('Error');
                      }
                    },
                  ),
                ),
              ),
              CardHeadings(
                heading: 'Trending Shows',
                left: 20,
                top: 20,
                fontsize: 18,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: size.height * 0.45,
                  child: FutureBuilder(
                    future: moviecontroller.trendingtv,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasData) {
                        return ShowGrid(
                          size: size,
                          snapshot: snapshot,
                        );
                      } else {
                        return const Text('Error');
                      }
                    },
                  ),
                ),
              ),
              CardHeadings(
                heading: 'Airing today',
                left: 20,
                top: 20,
                fontsize: 18,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: size.height * 0.45,
                  child: FutureBuilder(
                    future: moviecontroller.airingtv,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasData) {
                        return ShowGrid(
                          size: size,
                          snapshot: snapshot,
                        );
                      } else {
                        return const Text('Error');
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
