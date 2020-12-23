import 'package:crypto_cash_user/screens/Login/index.dart';
import 'package:crypto_cash_user/screens/SignUp/index.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static final String id = 'splashscreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF011143),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontFamily: 'Bellany',
                    color: Color(0xFFE0E0E0),
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: new BorderRadius.circular(30.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 2.1,
                height: 45,
                color: Colors.yellow[700],
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'XXBASE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 40,
                    child: RaisedButton(
                      elevation: 0,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen())),
                      color: Color(0xFF011143),
                      padding: EdgeInsets.all(10.0),
                      shape: new RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white),
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 40,
                    child: RaisedButton(
                      elevation: 0,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen())),
                      color: Colors.yellow[700],
                      padding: EdgeInsets.all(10.0),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
