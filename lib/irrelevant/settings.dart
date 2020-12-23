import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white70,
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.menu),
            onPressed: () {},
          ),
        ),
        title: Text(
          'Crypto Cash\$',
          style: TextStyle(
            fontFamily: 'Bellany',
            color: Color(0xFFE0E0E0),
            fontSize: 26.0,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 10, bottom: 10),
            child: SizedBox(
              height: 20,
              width: 35,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage("images/bitcoin.png"),
                radius: 5,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFF011143),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: (MediaQuery.of(context).size.height / 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Total balance ',
                      style: TextStyle(
                        fontFamily: 'Bellany',
                        color: Color(0xFFE0E0E0),
                        fontSize: 15.0,
                      ),
                    ),
                    Text(
                      '+12.22%',
                      style: TextStyle(
                        fontFamily: 'Bellany',
                        color: Colors.green,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  '\$ 4569.45',
                  style: TextStyle(
                    fontFamily: 'Bellany',
                    color: Color(0xFFE0E0E0),
                    fontSize: 30.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.6,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 21.0),
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
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          elevation: 20,
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
                            width: 115,
                            height: 40,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: CircleAvatar(
                                      radius: 10,
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
                          elevation: 20,
                          padding: EdgeInsets.all(0),
                          onPressed: () {},
                          color: Color(0xFF001328),
                          child: Container(
                            width: 115,
                            height: 40,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: CircleAvatar(
                                      radius: 10,
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
                          elevation: 20,
                          padding: EdgeInsets.all(0),
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          color: Color(0xFF001328),
                          child: Container(
                            width: 115,
                            height: 40,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: CircleAvatar(
                                      radius: 10,
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
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          elevation: 20,
                          padding: EdgeInsets.all(0),
                          onPressed: () {},
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                          color: Color(0xFF001328),
                          child: Container(
                            width: 110,
                            height: 90,
                            child: Center(
                              child:
                                  Icon(Icons.add, size: 50, color: Colors.grey),
                            ),
                          ),
                        ),
                        RaisedButton(
                          elevation: 20,
                          padding: EdgeInsets.all(0),
                          onPressed: () {},
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                          color: Color(0xFF001328),
                          child: Container(
                            width: 110,
                            height: 90,
                            child: Center(
                              child:
                                  Icon(Icons.add, size: 50, color: Colors.grey),
                            ),
                          ),
                        ),
                        RaisedButton(
                          elevation: 20,
                          padding: EdgeInsets.all(0),
                          onPressed: () {},
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                          color: Color(0xFF001328),
                          child: Container(
                            width: 110,
                            height: 90,
                            child: Center(
                              child:
                                  Icon(Icons.add, size: 50, color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          elevation: 20,
                          padding: EdgeInsets.all(0),
                          onPressed: () {},
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                          color: Color(0xFF001328),
                          child: Container(
                            width: 110,
                            height: 90,
                            child: Center(
                              child:
                                  Icon(Icons.add, size: 50, color: Colors.grey),
                            ),
                          ),
                        ),
                        RaisedButton(
                          elevation: 20,
                          padding: EdgeInsets.all(0),
                          onPressed: () {},
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                          color: Color(0xFF001328),
                          child: Container(
                            width: 110,
                            height: 90,
                            child: Center(
                              child:
                                  Icon(Icons.add, size: 50, color: Colors.grey),
                            ),
                          ),
                        ),
                        RaisedButton(
                          elevation: 20,
                          padding: EdgeInsets.all(0),
                          onPressed: () {},
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                          color: Color(0xFF001328),
                          child: Container(
                            width: 110,
                            height: 90,
                            child: Center(
                              child:
                                  Icon(Icons.add, size: 50, color: Colors.grey),
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
      ),
    );
  }
}
