import 'package:booking_trip_app/manage_trip.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_trip.dart';
import 'db_helper/database1.dart';

class MyTripScreen extends StatefulWidget {
  const MyTripScreen({super.key});

  @override
  State<MyTripScreen> createState() => _MyTripScreenState();
}

class _MyTripScreenState extends State<MyTripScreen> {
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

  Widget createView(BuildContext context, int index) {
    final data = bookingList[index];
    var bgColor = Colors.teal.shade100;
    if (data.explored) {
      bgColor = const Color.fromARGB(255, 240, 180, 180);
    }
    return Card(
      color: bgColor,
      margin: EdgeInsets.all(10),
      child: ListTile(
        onLongPress: () async {
          // update todo
          Map<String, dynamic> dataDic = {'isDone': data.explored ? 0 : 1};

          await DBManagerWeb.shared.updateToDo(id: data.id, map: dataDic);

          //fetch updated data
          fetchbookings();
        },
        leading: data.explored ? Icon(Icons.arrow_circle_right) : null,
        title: Text(data.from),
        subtitle: Text(data.to),
        trailing: InkWell(
          onTap: () async {
            await DBManagerWeb.shared.deleteToDo(data.id);
            fetchbookings();
          },
          child: Icon(Icons.delete),
        ),
        //add inkwell later here
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'MY',
              style: GoogleFonts.staatliches(fontSize: 56, color: Colors.black),
            ),
            Text(
              'BOOKINGS',
              style: GoogleFonts.staatliches(
                fontSize: 46,
                color: const Color.fromARGB(255, 255, 40, 40),
              ),
            ),
          ],
        ),
      ),
      body: (bookingList.isEmpty)
          ? Center(child: Image.asset('../images/booking_app/add_data.jpg'))
          : ListView.builder(
              itemCount: bookingList.length,
              itemBuilder: createView,
            ),
    );
  }
}
