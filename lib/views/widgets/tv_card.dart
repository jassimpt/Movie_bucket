import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/api_constants.dart';
import 'package:netflix_clone/views/pages/details_screen.dart';

class TvCard extends StatelessWidget {
  AsyncSnapshot snapshot;

  TvCard({
    required this.snapshot,
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    ApiConstants api = ApiConstants();
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
                        type: "tv/",
                        name: data.name,
                        casturl:
                            "${api.base}tv/${data.id}${ApiConstants().castend}",
                        data: data,
                        date: data.first_air_date,
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
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
              ),
            ),
          );
        },
      ),
    );
  }
}
