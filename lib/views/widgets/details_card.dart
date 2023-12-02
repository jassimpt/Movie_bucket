import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/constants/api_constants.dart';
import 'package:netflix_clone/views/pages/details_screen.dart';

class DetailsCard extends StatelessWidget {
  DetailsCard(
      {super.key,
      required this.size,
      required this.snapshot,
      required this.width,
      required this.iscast});
  AsyncSnapshot snapshot;
  final Size size;
  double width;
  bool iscast;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: snapshot.data!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final data = snapshot.data![index];
          String name;

          String image;
          if (iscast) {
            image = data.profile_path ?? "";
            name = data.name ?? "no name";
          } else {
            image = data.poster_path ?? "";
            name = data.title ?? "No name";
          }

          return GestureDetector(
            onTap: iscast
                ? () {}
                : () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                            type: "movie/",
                            name: data.title,
                            data: data,
                            date: data.release_date,
                            casturl:
                                "${ApiConstants().base}movie/${data.id}${ApiConstants().castend}")));
                  },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5, left: 8, right: 8),
                  child: Container(
                    height: size.height * .2,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(
                                "${ApiConstants().posterurl}${image}"),
                            fit: BoxFit.cover)),
                  ),
                ),
                Text(
                  name,
                  style: GoogleFonts.poppins(fontSize: 13),
                )
              ],
            ),
          );
        });
  }
}
