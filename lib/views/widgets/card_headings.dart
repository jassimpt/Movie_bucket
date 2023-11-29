import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardHeadings extends StatelessWidget {
  double left;
  double top;
  String heading;
  double? fontsize;
  CardHeadings({
    this.fontsize,
    required this.heading,
    required this.left,
    required this.top,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left, top: top),
      child: Text(
        heading,
        style: GoogleFonts.poppins(
            fontSize: fontsize ?? 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
