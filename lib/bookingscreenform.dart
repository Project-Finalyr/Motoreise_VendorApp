import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:motoreise_partnerapp/HomePage.dart';
import 'package:motoreise_partnerapp/main.dart';
import 'Database1.dart';
import 'authentications.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


class BookingForm extends StatefulWidget {
  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final items=['Jaipur','kota','Kedarnath','Shimla','Rishikesh','Manali'];
  String value;
  String Name;
  String  phonenumber;
  String password;
  String city;
  String occupation;
  String rate;
  String slots;



  bool showCircular1=false;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();


  Future<void> handleSignup() async{
    if (formkey.currentState.validate()) {
      formkey.currentState.save();
      setState(() {
        showCircular1=true;
      });

          FirebaseUser user = await FirebaseAuth.instance.currentUser();

          // Similarly we can get email as well
          // pushinfo();

          DatabaseService(uid: user.uid,city:city).updateUserData(Name,phonenumber,occupation,city,rate,slots);

          // final uemail = user.email;

    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            SizedBox(height: 10.0),

            Container(
              width: MediaQuery.of(context).size.width * 0.90,
              child: Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Name"),
                      validator: (_val) {
                        if (_val.isEmpty) {
                          return "Can't be empty";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (val) {
                        Name = val;
                      },
                    ),


                    SizedBox(height: 15,),
                    IntlPhoneField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Phone number"),
                      validator: (_val) {
                        if (_val.isEmpty) {
                          return "Can't be empty";
                        } else {
                          return null;
                        }
                      },
                      initialCountryCode: 'IN',

                      onChanged: (val) {
                        phonenumber = val.completeNumber;
                      },
                    ),

                    SizedBox(height: 15,),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Activity"),
                      validator: (_val) {
                        if (_val.isEmpty) {
                          return "Can't be empty";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (val) {
                        occupation  = val;
                      },
                    ),
                    SizedBox(height:15,),

                    Container(
                      width: 350,
                      padding: EdgeInsets.symmetric(horizontal: 12,vertical:4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border:Border.all(color: Colors.grey),
                      ),
                      child: DropdownButton<String>(
                        value: value,
                        iconSize: 36,
                        hint: Text("Select the city"),

                        icon:Icon(Icons.arrow_drop_down,color: Colors.grey,),
                        isExpanded:true,
                        items: items.map(buildMenuItem).toList(),
                          onChanged:(value)=>setState(()=>this.value=value),

                          //elevation: 5,



                        ),
                    ),

                    SizedBox(height: 15,),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Rate of Activity"),
                      validator: (_val) {
                        if (_val.isEmpty) {
                          return "Can't be empty";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (val) {
                        rate  = val;
                      },
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Slots per day"),
                      validator: (_val) {
                        if (_val.isEmpty) {
                          return "Can't be empty";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (val) {
                        slots  = val;
                      },
                    ),
                    SizedBox(height: 50,),
                    showCircular1 ? CircularProgressIndicator() : SizedBox(),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        height: 50.0,
                        width: 250.0,
                        child: FloatingActionButton(
                          heroTag: "btn2",
                          backgroundColor: Colors.orange,
                          onPressed: (){

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage1(),)
                            );
                          },
                          child: Text('Submit',style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,

                          ),),
                          shape: RoundedRectangleBorder(

                              borderRadius: BorderRadius.all(Radius.circular(15.0))
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),



          ],
        ),
      ),
    );

  }

DropdownMenuItem<String> buildMenuItem(String item)=>
    DropdownMenuItem(value:item,child:Text(
      item,style:TextStyle(fontSize:20),
    ));

}