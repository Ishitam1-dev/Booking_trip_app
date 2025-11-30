//import 'package:booking_trip_app/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:booking_trip_app/home.dart';

class LoginApp extends StatelessWidget {
  LoginApp({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('../images/booking_app/logo.webp'),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(height: 30),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    //user name field
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'username or email',
                        labelText: 'UserName',
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
                          return 'please enter name';
                        } else if (value != 'ishita') {
                          return 'name does not match';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) => print('done new name'),
                    ),

                    //password field
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'password',
                        labelText: 'password',
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
                          return 'please enter password';
                        } else if (value != '12345') {
                          return 'password does not match';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) => print('done new password'),
                    ),

                    //login button
                    SizedBox(height: 20),
                    OutlinedButton(
                      onPressed: () async {
                        //validation to check

                        final isvalid = formKey.currentState!.validate();
                        if (isvalid) {
                          formKey.currentState!.save();

                          if (isvalid) {
                            formKey.currentState!.save();
                          }

                          //push after validation
                          final obj = await SharedPreferences.getInstance();
                          await obj.setBool('is_Login', true);

                          // push to another page
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Welcome()),
                          );
                        }
                      },
                      child: Text('LOGIN'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
