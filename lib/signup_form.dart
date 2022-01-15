import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:motoreise_partnerapp/HomePage.dart';
import 'Database.dart';
import 'authentications.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String fullname;
String email;
  String  phonenumber;
String password;
String address;
String occupation;
String experience;
String details;
String accountnumber;
String bankname;
String aadharnumber;
String pannumber;
String certification;


bool showCircular1=false;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();


  Future<void> handleSignup() async{
    if (formkey.currentState.validate()) {
      formkey.currentState.save();
      setState(() {
        showCircular1=true;
      });
      signUp(email.trim(), password, context).then((value) async{

        if (value != null) {
          setState(() {
            showCircular1=false;
          });
          FirebaseUser user = await FirebaseAuth.instance.currentUser();

          // Similarly we can get email as well
         // pushinfo();

          DatabaseService(uid: user.uid).updateUserData(fullname,email,phonenumber,address,occupation,experience,details,accountnumber,bankname,aadharnumber,pannumber,certification);
         // final uemail = user.email;
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(uid:user.uid,mail:user.email),
              ));
        }
      });
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
                            border: OutlineInputBorder(), labelText: "Full Name"),
                        validator: (_val) {
                          if (_val.isEmpty) {
                            return "Can't be empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          fullname = val;
                        },
                      ),

                      SizedBox(height: 15,),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Email"),
                        validator: (_val) {
                          if (_val.isEmpty) {
                            return "Can't be empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          email = val;
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
                            border: OutlineInputBorder(), labelText: "Address"),
                        validator: (_val) {
                          if (_val.isEmpty) {
                            return "Can't be empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          address = val;
                        },
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "What do you do"),
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
                      SizedBox(height: 15,),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Experience"),
                        validator: (_val) {
                          if (_val.isEmpty) {
                            return "Can't be empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          experience  = val;
                        },
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Details about work"),
                        validator: (_val) {
                          if (_val.isEmpty) {
                            return "Can't be empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          details  = val;
                        },
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Account number"),
                        validator: (_val) {
                          if (_val.isEmpty) {
                            return "Can't be empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          accountnumber  = val;
                        },
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Bank name"),
                        validator: (_val) {
                          if (_val.isEmpty) {
                            return "Can't be empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          bankname  = val;
                        },
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Aadhar number"),
                        validator: (_val) {
                          if (_val.isEmpty) {
                            return "Can't be empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          aadharnumber  = val;
                        },
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "PAN number"),
                        validator: (_val) {
                          if (_val.isEmpty) {
                            return "Can't be empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          pannumber  = val;
                        },
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Certification"),
                        validator: (_val) {
                          if (_val.isEmpty) {
                            return "Can't be empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          certification  = val;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password"),
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "This Field Is Required."),
                            MinLengthValidator(6,
                                errorText: "Minimum 6 Characters Required.")
                          ]),
                          onChanged: (val) {
                            password = val;
                          },
                        ),
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
                              handleSignup();
                            },
                            child: Text('Create Account',style: TextStyle(color: Colors.white,
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



}