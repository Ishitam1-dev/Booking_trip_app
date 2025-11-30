import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  Widget travelBox(String text, String imagePath) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      height: 250,
      width: 250,
      decoration: BoxDecoration(
        gradient: RadialGradient(colors: [Colors.amber, Colors.black87]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, fit: BoxFit.cover),
          SizedBox(height: 10),
          Text(
            text,
            style: GoogleFonts.aboreto(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'POPULAR',
              style: GoogleFonts.staatliches(fontSize: 46, color: Colors.black),
            ),
            Text(
              'PLACES',
              style: GoogleFonts.staatliches(
                fontSize: 56,
                color: const Color.fromARGB(255, 255, 40, 40),
              ),
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        scrollDirection: Axis.vertical,
        // childAspectRatio: 2,
        children: [
          travelBox('KERAL', "../images/booking_app/kerala.jpg"),
          travelBox('RAJASTHAN', "../images/booking_app/rajashthan.jpeg"),
          travelBox('GUJARAT', "../images/booking_app/gujarat.jpeg"),
          travelBox('MADHYA PRADESH', "../images/booking_app/mp.jpeg"),
          travelBox('ODISHA', "../images/booking_app/odisha.jpeg"),
          travelBox('HIMACHAL', "../images/booking_app/shimla.webp"),
        ],
      ),
    );
  }
}
