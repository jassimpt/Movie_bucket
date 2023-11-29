import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/api_constants.dart';
import 'package:netflix_clone/services/apiservice.dart';

class MovieCarousal extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const MovieCarousal({
    required this.snapshot,
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CarouselSlider.builder(
          itemCount: snapshot.data.length,
          options: CarouselOptions(
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            height: size.height * 0.4,
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
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                '${ApiConstants().posterurl}${snapshot.data[itemindex].poster_path}'),
                            fit: BoxFit.fill,
                            filterQuality: FilterQuality.high),
                        color: Colors.amber,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  )
                ],
              ),
            );
          }),
    );
  }
}