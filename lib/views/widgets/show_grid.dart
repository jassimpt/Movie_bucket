import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/constants/api_constants.dart';

class ShowGrid extends StatelessWidget {
  AsyncSnapshot snapshot;

  ShowGrid({
    required this.snapshot,
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: snapshot.data!.length,
      scrollDirection: Axis.horizontal,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        final tvshowdata = snapshot.data![index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Container(
                  width: size.width * 0.4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "${ApiConstants().posterurl}${tvshowdata.poster_path}"),
                          fit: BoxFit.fill),
                      color: Colors.amber,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              tvshowdata.name,
              style: GoogleFonts.poppins(fontSize: 15),
              maxLines: 2,
            )
          ],
        );
      },
    );
  }
}
