import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/views/widgets/custom_button.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Image.asset('assets/images/Onboarding.png'),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Movie Bucket',
            style: GoogleFonts.teko(fontSize: 40),
          ),
          Text(
            'Explore everything you want',
            style: GoogleFonts.firaSans(fontSize: 20),
          ),
          Text(
            'For free',
            style: GoogleFonts.firaSans(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(size: size)
        ],
      ),
    );
  }
}
