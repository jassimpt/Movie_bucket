import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/api_constants.dart';
import 'package:netflix_clone/services/apiservice.dart';
import 'package:netflix_clone/views/pages/details_screen.dart';

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
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          final data = snapshot.data[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                        moviedata: data,
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
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
          );
        },
      ),
    );
  }
}
