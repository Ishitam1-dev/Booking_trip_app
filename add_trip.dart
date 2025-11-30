import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'db_helper/database1.dart';

class AddTripScreen extends StatefulWidget {
  const AddTripScreen({super.key});

  @override
  State<AddTripScreen> createState() => _AddTripScreenState();
}

class _AddTripScreenState extends State<AddTripScreen> {
  final fromcontroller = TextEditingController();
  final tocontroller = TextEditingController();

  bool explored = false;
  final formKey = GlobalKey<FormState>();

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
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: fromcontroller,
                          decoration: InputDecoration(
                            hintText: 'From Where you want to Go',
                            labelText: 'FROM :',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.black26,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: const Color.fromARGB(184, 105, 79, 255),
                                width: 2,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 20),

                        TextFormField(
                          controller: tocontroller,
                          decoration: InputDecoration(
                            hintText: 'Where you want To GO',
                            labelText: 'TO',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.black26,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: const Color.fromARGB(184, 105, 79, 255),
                                width: 2,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter where you go';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        //user name field
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'When, the date',
                            labelText: 'DATE:',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.black26,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: const Color.fromARGB(184, 105, 79, 255),
                                width: 2,
                              ),
                            ),
                          ),
                        ),

                        //password field
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter Duration of Days',
                            labelText: 'Duration:',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.black26,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: const Color.fromARGB(184, 105, 79, 255),
                                width: 2,
                              ),
                            ),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('EXPLORED:', style: TextStyle(fontSize: 20)),
                            Switch(
                              value: explored,
                              onChanged: (newvalue) {
                                explored = newvalue;
                                setState(() {});
                              },
                            ),
                          ],
                        ),

                        //add button
                        SizedBox(height: 50),
                        OutlinedButton(
                          child: Text('ADD TO MY TRIPS'),
                          onPressed: () async {
                            formKey.currentState!.validate();

                            final from = fromcontroller.text;
                            final to = tocontroller.text;

                            final Map<String, dynamic> dataDict = {
                              'from': from,
                              'to': to,

                              'explored': explored ? 1 : 0,
                            };

                            final insertRows = await DBManagerWeb.shared
                                .insertTrip(dataDict);

                            if (insertRows > 0) {
                              //show message
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Trip Insert Successfully.'),
                                ),
                              );

                              Navigator.pop(context, true);
                            }
                            ;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
