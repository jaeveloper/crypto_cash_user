import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_cash_user/model/user_model.dart';
import 'package:crypto_cash_user/screens/deposit.dart';
import 'package:crypto_cash_user/screens/edit_profile_screen.dart';
import 'package:crypto_cash_user/screens/histRecieve.dart';
import 'package:crypto_cash_user/screens/history.dart';
import 'package:crypto_cash_user/screens/news_feed.dart';
import 'package:crypto_cash_user/screens/request.dart';
import 'package:crypto_cash_user/services/authentication.dart';
import 'package:crypto_cash_user/services/database_service.dart';
import 'package:crypto_cash_user/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  final String currentUserId;
  final String userId;

  ProfilePage({this.currentUserId, this.userId});

  static final String id = 'profile';
  bool isSelect;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User _profileUser;
  FlutterToast flutterToast;
  @override
  void initState() {
    super.initState();
    flutterToast = FlutterToast(context);
    _setupProfileUser();
  }

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.grey[400],
      ),
      child: Text("Please request \$100 into USD account to start trading"),
    );

    flutterToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
    );
  }

  _setupProfileUser() async {
    User profileUser = await DatabaseService.getUserWithId(widget.userId);
    if (mounted) {
      setState(() {
        _profileUser = profileUser;
      });
    }
  }

  _submit() {
    UserAuth.logout(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      // bottomNavigationBar: BottomNavBar(),
      appBar: new AppBar(
        backgroundColor: Color(0xFF011143),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Text(
              'PROFILE',
              style: TextStyle(
                  color: Colors.white, fontSize: 22, fontFamily: 'Billabong'),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFF011143),
      body: FutureBuilder(
        future: Firestore.instance
            .collection('users')
            .document(widget.userId)
            .get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          User user = User.fromDoc(snapshot.data);
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              Container(
                height: (MediaQuery.of(context).size.height / 5),
                width: MediaQuery.of(context).size.width / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfileScreen(
                                    user: user,
                                  ))),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: user.profileImageUrl.isEmpty
                            ? AssetImage('images/user_placeholder.jpg')
                            : CachedNetworkImageProvider(user.profileImageUrl),
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 90,
                    ),
                    Text(
                      user.name,
                      style: TextStyle(
                        fontFamily: 'Bellany',
                        color: Color(0xFFE0E0E0),
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.7,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text(
                            'Default currency',
                            style: TextStyle(
                              fontFamily: 'Bellany',
                              color: Colors.black87,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 44.8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              elevation: 80,
                              padding: EdgeInsets.all(0),
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              color: Color(0xFF001328),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 3.6,
                                height:
                                    MediaQuery.of(context).size.height / 22.4,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: CircleAvatar(
                                          radius: 10,
                                          backgroundColor: Colors.green,
                                          backgroundImage:
                                              AssetImage("images/usd.png"),
                                        ),
                                      ),
                                      Text(
                                        'USD',
                                        style: TextStyle(
                                          fontFamily: 'Bellany',
                                          color: Colors.white70,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            RaisedButton(
                              elevation: 0,
                              padding: EdgeInsets.all(0),
                              onPressed: () {},
                              color: Colors.indigo[200],
                              child: Container(
                                width: MediaQuery.of(context).size.width / 3.6,
                                height:
                                    MediaQuery.of(context).size.height / 22.4,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.blue,
                                          radius: 10,
                                          backgroundImage:
                                              AssetImage("images/euros.png"),
                                        ),
                                      ),
                                      Text(
                                        'EUR',
                                        style: TextStyle(
                                          fontFamily: 'Bellany',
                                          color: Colors.white70,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            RaisedButton(
                              elevation: 0,
                              padding: EdgeInsets.all(0),
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              color: Colors.indigo[200],
                              child: Container(
                                width: MediaQuery.of(context).size.width / 3.6,
                                height:
                                    MediaQuery.of(context).size.height / 22.4,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.purple,
                                          radius: 10,
                                          backgroundImage:
                                              AssetImage("images/pounds.png"),
                                        ),
                                      ),
                                      Text(
                                        'GBP',
                                        style: TextStyle(
                                          fontFamily: 'Bellany',
                                          color: Colors.white70,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RaisedButton(
                              elevation: 5,
                              padding: EdgeInsets.all(0),
                              onPressed: () {
                                _showToast();
                              }, //_submit,
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.white,
                              child: Container(
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.height / 10,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Image(
                                        image:
                                            AssetImage("images/exchange.png"),
                                        height: 30,
                                        width: 30,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Center(
                                      child: Text(
                                        'Exchange',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 9),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            RaisedButton(
                              elevation: 5,
                              padding: EdgeInsets.all(0),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HistRecieve(
                                      currentUserId: widget.currentUserId,
                                      userId: widget.currentUserId),
                                ),
                              ),
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.white,
                              child: Container(
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.height / 10,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Icon(
                                        Icons.view_list,
                                        color: Colors.green,
                                        size: 35,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Center(
                                      child: Text(
                                        'History',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 9),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            RaisedButton(
                              elevation: 5,
                              padding: EdgeInsets.all(0),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SendRecieve(
                                      currentUserId: widget.currentUserId,
                                      userId: widget.currentUserId),
                                ),
                              ),
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.white,
                              child: Container(
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.height / 10,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Image(
                                        image: AssetImage(
                                            "images/sendrecieve.png"),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Center(
                                      child: Text(
                                        'Request',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 9),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 45,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RaisedButton(
                              elevation: 5,
                              padding: EdgeInsets.all(0),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Deposit(
                                      currentUserId: widget.currentUserId,
                                      userId: widget.currentUserId),
                                ),
                              ),
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.white,
                              child: Container(
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.height / 10,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Image(
                                        image: AssetImage("images/deposit.png"),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Center(
                                      child: Text(
                                        'Deposit',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 9),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            RaisedButton(
                              elevation: 5,
                              padding: EdgeInsets.all(0),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              ),
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.white,
                              child: Container(
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.height / 10,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Image(
                                        image: AssetImage("images/news.png"),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Center(
                                      child: Text(
                                        'News',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 10),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            RaisedButton(
                              elevation: 5,
                              padding: EdgeInsets.all(0),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProfileScreen(
                                            user: user,
                                          ))),
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.white,
                              child: Container(
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.height / 10,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Image(
                                        image:
                                            AssetImage("images/settings.png"),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Center(
                                      child: Text(
                                        'Settings',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 9),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
