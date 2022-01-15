//import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motoreise_partnerapp/BookingScreen.dart';
import 'package:motoreise_partnerapp/MessageScreen.dart';
import 'package:motoreise_partnerapp/ProfileScreen.dart';
import 'package:motoreise_partnerapp/authentications.dart';
import 'package:motoreise_partnerapp/main.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
TextEditingController _addItemController = TextEditingController();

List<String> videoID = [];
DocumentReference linkRef;
bool showItem = false;
final utube =
RegExp(r"^(https?\:\/\/)?((www\.)?youtube\.com|youtu\.?be)\/.+$");
class HomePage extends StatefulWidget {
  final String uid;
  final String mail;

  HomePage({Key key, @required this.uid,@required this.mail}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState(uid,mail);
}

class _HomePageState extends State<HomePage> {


  final String uid;
  final String mail;
  _HomePageState(this.uid,this.mail);


   int selectedPage = 0;

  final _pageOptions = [
    HomeScreen(),
    BookingScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.orange),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.notifications,color: Colors.orange,size: 25.0,),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //builder: (context) => LoginPage(),
                  ),
                );
              }
          )
        ],
      ),
      drawer:Drawer(child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          new Container(
              height: 280.0,

              child: Column(
                children: <Widget>[
                  new DrawerHeader(

                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: FlatButton(
                          onPressed: () {

                          },

                          child: new Icon(
                            Icons.account_box,
                            color: Colors.white,
                            size: 150.0,
                          ),
                          shape: new CircleBorder(),
                          color: Colors.orangeAccent,

                        ),
                      ),

                  ),
                  SizedBox(height: 15,),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),

                        child: Text('Email :-  '+mail.toString(),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        ),

                    ),
                  )
                ],
              ),
              color:Colors.orangeAccent),
          SizedBox(height: 4.0),

          ListTile(
            leading: Icon(Icons.contact_mail,color: Colors.black,size: 25.0,),
            title: Text('Contact us',
              style: TextStyle(
                fontSize: 18.0,
              ),),
            onTap: () {

            },
          ),

          SizedBox(height: 6.0),
          ListTile(
            leading: Icon(Icons.power_settings_new,color: Colors.black,size: 25.0,),
            title: Text('Log Out',
              style: TextStyle(
                fontSize: 18.0,
              ),),
            onTap: () =>signOutUser().then((value) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomePage1()),
                      (Route<dynamic> route) => false);
            }),
          ),


        ],
      ),
      ),
      body: _pageOptions[selectedPage],
      bottomNavigationBar: BottomNavigationBar(

        elevation: 1.0,
        backgroundColor: Colors.orangeAccent,
        type: BottomNavigationBarType.fixed,

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            
            icon: Icon(Icons.home,color: Colors.white,),
            title: Text('Home',
            style: TextStyle(
              color: Colors.white,
            ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book,color: Colors.white,),
            title: Text('Bookings',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message,color: Colors.white,),
            title: Text('Message',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle,color: Colors.white,),
            title: Text('Profile',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
//        selectedItemColor: Colors.black,
//        unselectedItemColor: Colors.white,
        currentIndex: selectedPage,
        onTap: (index){
          setState(() {
            selectedPage = index;
          });
        },
      ),








    );
  }
}

class HomeScreen extends StatefulWidget {

  @override
  Widget build(BuildContext){

  }
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(

        child: Scaffold(

            backgroundColor: Colors.black,
            body: Center(
                child: Column(
                    children: <Widget>[


                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            15.0, 5.0, 15.0, 8.0),
                        child: Text("Training videos",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 28,
                            )
                        ),
                      ),

                      Expanded(
                        child: Column(
                          children: [

                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              child: TextField(
                                controller: _addItemController,
                                onEditingComplete: () {
                                  if (utube.hasMatch(_addItemController.text)) {
                                    _addItemFuntion();
                                  } else {
                                    FocusScope.of(this.context).unfocus();
                                    _addItemController.clear();
                                    Flushbar(
                                      title: 'Invalid Link',
                                      message: 'Please provide a valid link',
                                      duration: Duration(seconds: 3),
                                      icon: Icon(
                                        Icons.error_outline,
                                        color: Colors.red,
                                      ),
                                    )
                                      ..show(context);
                                  }
                                },
                                style: TextStyle(fontSize: 16),
                                decoration: InputDecoration(
                                    labelText: 'Your Video URL',
                                    suffixIcon: GestureDetector(
                                      child: Icon(Icons.add, size: 32),
                                      onTap: () {
                                        if (utube.hasMatch(
                                            _addItemController.text)) {
                                          _addItemFuntion();
                                        } else {
                                          FocusScope.of(this.context).unfocus();
                                          _addItemController.clear();
                                          Flushbar(
                                            title: 'Invalid Link',
                                            message: 'Please provide a valid link',
                                            duration: Duration(seconds: 3),
                                            icon: Icon(
                                              Icons.error_outline,
                                              color: Colors.red,
                                            ),
                                          )
                                            ..show(context);
                                        }
                                      },
                                    )),
                              ),
                            ),
                            Flexible(
                                child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 4),
                                    child: ListView.builder(
                                        itemCount: videoID.length,
                                        itemBuilder: (context, index) =>
                                            Container(
                                              margin: EdgeInsets.all(8),
                                              child: YoutubePlayer(
                                                controller: YoutubePlayerController(
                                                    initialVideoId: YoutubePlayer
                                                        .convertUrlToId(
                                                        videoID[index]),
                                                    flags: YoutubePlayerFlags(
                                                      autoPlay: false,
                                                    )),
                                                showVideoProgressIndicator: true,
                                                progressIndicatorColor: Colors
                                                    .blue,
                                                progressColors: ProgressBarColors(
                                                    playedColor: Colors.blue,
                                                    handleColor: Colors
                                                        .blueAccent),
                                              ),
                                            )))),
                          ],
                        ),
                      ),
                    ]
                )
            )
        )
    );
  }

  _addItemFuntion() async {
    await linkRef.setData({
      _addItemController.text.toString(): _addItemController.text.toString()
    },merge:true);
    Flushbar(
        title: 'Added',
        message: 'updating...',
        duration: Duration(seconds: 3),
        icon: Icon(Icons.info_outline))
      ..show(context);
    setState(() {
      videoID.add(_addItemController.text);
    });
    print('added');
    FocusScope.of(this.context).unfocus();
    _addItemController.clear();
  }

  void initState() {
    linkRef = Firestore.instance.collection('links').document('urls');
    super.initState();
    getData();
    print(videoID);
  }

  getData() async {
    await linkRef
        .get()
        .then((value) =>
        value.data?.forEach((key, value) {
          if (!videoID.contains(value)) {
            videoID.add(value);
          }
        }))
        .whenComplete(() =>
        setState(() {
          videoID.shuffle();
          showItem = true;
        }));
  }
}










