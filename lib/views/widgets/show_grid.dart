import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/constants/api_constants.dart';
import 'package:netflix_clone/views/pages/details_screen.dart';

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
    ApiConstants api = ApiConstants();
    return GridView.builder(
      itemCount: snapshot.data!.length,
      scrollDirection: Axis.horizontal,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        final tvshowdata = snapshot.data![index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsScreen(
                    type: 'tv/',
                    name: tvshowdata.name,
                    data: tvshowdata,
                    date: tvshowdata.first_air_date,
                    casturl:
                        "${api.base}tv/${tvshowdata.id}${ApiConstants().castend}")));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: size.width * 0.32,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "${ApiConstants().posterurl}${tvshowdata.poster_path}"),
                            fit: BoxFit.fill),
                        color: Colors.black.withOpacity(0.2),
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
          ),
        );
      },
    );
  }
}
