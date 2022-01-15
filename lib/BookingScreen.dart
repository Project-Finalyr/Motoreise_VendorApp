import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:motoreise_partnerapp/bookingscreenform.dart';
import 'package:motoreise_partnerapp/HomePage.dart';
TextStyle textButton = TextStyle(
  color: Colors.deepPurple,
  fontSize: 18,
  fontWeight: FontWeight.w700,
);
class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            SizedBox(
              height: 40,
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: 30),
              child:Text(
                'Please enter the Activity details',
                style: TextStyle(color: Color(0xFF1B383A), fontSize: 32, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child:Row(
                children: [
                  Text(
                    'It is quick and easy for customers',
                    style: TextStyle(
                        color: Color(0xFF59706F), fontSize: 18, fontWeight: FontWeight.w500),
                  ),


                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: BookingForm(),
            ),


            SizedBox(height: 10,),
          ],
        ),
      ),

    );
  }
}

