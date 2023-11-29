import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/views/widgets/bottom_nav.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const BottomNavigation()));
      },
      child: Container(
          width: size.width * .5,
          height: size.height * .05,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xff19a1be), Color(0xff7d4192)],
              )),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Text('Enter now',
                    style: GoogleFonts.firaSans(fontSize: 18)),
              ),
            ),
          )),
    );
  }
}
