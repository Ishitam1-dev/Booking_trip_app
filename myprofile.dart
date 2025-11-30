import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyprofileScreen extends StatelessWidget {
  const MyprofileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'MAKE',
              style: GoogleFonts.staatliches(fontSize: 46, color: Colors.black),
            ),
            Text(
              'YOUR',
              style: GoogleFonts.staatliches(
                fontSize: 36,
                color: const Color.fromARGB(255, 255, 40, 40),
              ),
            ),
            Text(
              'TRIP',
              style: GoogleFonts.staatliches(fontSize: 46, color: Colors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Center(
          child: Container(
            height: 450,
            width: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                // fit: BoxFit.cover,
                image: AssetImage('../images/booking_app/coming.jpeg'),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
