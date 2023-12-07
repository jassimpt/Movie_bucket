import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/api_constants.dart';
import 'package:netflix_clone/views/pages/details_screen.dart';
import 'package:shimmer/shimmer.dart';

class MovieCards extends StatelessWidget {
  AsyncSnapshot snapshot;

  MovieCards({
    required this.snapshot,
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.25,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          final data = snapshot.data[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                        type: "movie/",
                        name: data.title,
                        casturl:
                            "${ApiConstants().base}movie/${data.id}${ApiConstants().castend}",
                        data: data,
                        date: data.release_date,
                      )));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Container(
                width: size.width * 0.4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "${ApiConstants().posterurl}${data.poster_path}"),
                        fit: BoxFit.cover),
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CardShimmer extends StatelessWidget {
  CardShimmer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.25,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[600]!,
            highlightColor: Colors.grey[100]!,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Container(
                width: size.width * 0.4,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
              ),
            ),
          );
        },
      ),
    );
  }
}
