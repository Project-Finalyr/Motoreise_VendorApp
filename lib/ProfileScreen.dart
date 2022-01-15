import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String uid;
  bool isObscure;
  bool isPress;

  @override
  void initState() {
    isObscure = false;
    isPress = false;
  }


  Stream<DocumentSnapshot> getData()async*{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    yield* Firestore.instance.collection('Partners').document(user.uid).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body:  new StreamBuilder<DocumentSnapshot>(
            stream: getData(), //returns a Stream<DocumentSnapshot>
            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (!snapshot.hasData) {
                return new Text("Loading");
              }
              var userDocument = snapshot.data;
              //return new Text(userDocument["firstname"]);
              return SingleChildScrollView(
                child: new Column(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 2.0, 1.0, 2.0),
                        child: Text('Edit Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(height: 30,),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 2.0, 1.0, 2.0),
                        child: Text(

                          'Phone number',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white54,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(height: 8.0,),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 2.0, 1.0, 2.0),
                        child: Text(
                          userDocument["phonenumber"],
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,

                          ),

                        ),
                      ),
                      alignment: Alignment.centerLeft,
                    ),



                    SizedBox(height: 5,),
                    Divider(
                      color: Colors.white54,
                      height: 30,
                    ),
                    SizedBox(height: 10,),


                    Align(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 2.0, 1.0, 2.0),
                        child: Text(

                          'Account number',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white54,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(height: 8.0,),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 2.0, 1.0, 2.0),
                        child: Text(
                          userDocument["accountnumber"],
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,

                          ),

                        ),
                      ),
                      alignment: Alignment.centerLeft,
                    ),




                    SizedBox(height: 10,),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 2.0, 1.0, 2.0),
                        child: Text(

                          'Bank name',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white54,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(height: 8.0,),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 2.0, 1.0, 2.0),
                        child: Text(
                          userDocument["bankname"],
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,

                          ),

                        ),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(height: 5,),
                    Divider(
                      color: Colors.white54,
                      height: 30,
                    ),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 2.0, 1.0, 2.0),
                        child: Text(

                          'PAN number',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white54,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(height: 8.0,),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 2.0, 1.0, 2.0),
                        child: Text(
                          userDocument["pannumber"],
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,

                          ),

                        ),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 2.0, 1.0, 2.0),
                        child: Text(

                          'aadhar numberr',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white54,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(height: 8.0,),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 2.0, 1.0, 2.0),
                        child: Text(
                          userDocument["aadharnumber"],
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,

                          ),

                        ),
                      ),
                      alignment: Alignment.centerLeft,
                    ),

                    SizedBox(height: 5,),
                    Divider(
                      color: Colors.white54,
                      height: 30,
                    ),
                    SizedBox(height: 10,),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 2.0, 1.0, 2.0),
                        child: Text(

                          'Certification  ',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white54,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(height: 8.0,),
                    Row(
                      children: <Widget>[
                        Align(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 2.0, 1.0, 2.0),
                            child: Text(
                              userDocument["certification"],
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,

                              ),

                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),

                      ],
                    ),



                    SizedBox(height: 5,),
                    Divider(
                      color: Colors.white54,
                      height: 30,
                    ),
                    SizedBox(height: 40,),

                    Center(
                      child: Container(
                        height: 50.0,
                        width: 280.0,
                        child: FloatingActionButton(
                          heroTag: "btn1",
                          backgroundColor: Colors.orange,
                          onPressed: (){

                          },
                          child: Text('Update Profile',style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,

                          ),),
                          shape: RoundedRectangleBorder(

                              borderRadius: BorderRadius.all(Radius.circular(15.0))
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),

                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}