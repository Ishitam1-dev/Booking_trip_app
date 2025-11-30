//import 'dart:math';

import 'package:booking_trip_app/add_trip.dart';
import 'package:booking_trip_app/db_helper/database1.dart';
import 'package:booking_trip_app/login.dart';
import 'package:booking_trip_app/manage_trip.dart';
import 'package:booking_trip_app/my_trip.dart';
import 'package:booking_trip_app/myprofile.dart';
import 'package:booking_trip_app/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  List<BookingData> bookingList = [];
  @override
  //init state
  initState() {
    super.initState();
    fetchbookings();
  }

  fetchbookings() async {
    bookingList = await DBManagerWeb.shared.fetchbookings();
    setState(() {});
  }

  Widget travelBox(String text, String imagePath) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      height: 250,
      width: 250,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(16),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () async {
          //open add screen
          await Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => AddTripScreen()));

          fetchbookings();
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              final obj = await SharedPreferences.getInstance();
              obj.setBool('is_Login', false);

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginApp()),
              );
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'EXPLORE',
              style: GoogleFonts.staatliches(fontSize: 40, color: Colors.black),
            ),
            Text(
              '  INDIA',
              style: GoogleFonts.staatliches(
                fontSize: 50,
                color: const Color.fromARGB(255, 34, 8, 138),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.horizontal(
            right: Radius.circular(50),
          ),
        ),
        backgroundColor: Colors.blue.shade50,
        child: ListView(
          padding: EdgeInsets.only(top: 30),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                'Ishita Makadiya',
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
              accountEmail: Text('ishitamakadiya@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 211, 188, 252),
                child: Icon(Icons.account_circle_rounded, size: 50),
              ),

              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 117, 151, 244),
              ),

              //side accounts
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 255, 253, 198),
                  child: Icon(Icons.account_circle_rounded, size: 20),
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Welcome()),
                );

                //push method
              },
            ),
            //wishlist
            ListTile(
              leading: Icon(Icons.place),
              title: Text('Popular places'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WishlistScreen()),
                );
              },
            ),

            //your booking
            ListTile(
              leading: Icon(Icons.bus_alert_outlined),
              title: Text('My Bookings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyTripScreen()),
                );

                //push method
              },
            ),
          

          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        scrollDirection: Axis.vertical,
        // childAspectRatio: 2,
        children: [
          travelBox('GUJARAT', "../images/booking_app/gujarat.jpeg"),
          travelBox('KERAL', "../images/booking_app/kerala.jpg"),
          travelBox('MADHYA PRADESH', "../images/booking_app/mp.jpeg"),
          travelBox('ODISHA', "../images/booking_app/odisha.jpeg"),
          travelBox('RAJASTHAN', "../images/booking_app/rajashthan.jpeg"),
          travelBox('HIMACHAL', "../images/booking_app/shimla.webp"),
          travelBox('TAMIL NADU', "../images/booking_app/tamilnadu.jpeg"),
          travelBox('UTTAR PRADESH', "../images/booking_app/up.webp"),
        ],
      ),
    );
  }
}



/*
REMAINING THINGS

DB CONNECTIVITY
class to store variable
add data at my trip

 */
