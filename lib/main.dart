import 'package:crypto_cash_user/model/user_data.dart';
import 'package:crypto_cash_user/screens/bottomnavbar.dart';
import 'package:crypto_cash_user/screens/home_balance.dart';
import 'package:crypto_cash_user/screens/profile.dart';
import 'package:crypto_cash_user/screens/splashscreen.dart';
import 'package:crypto_cash_user/theme/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget _getScreenId() {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          Provider.of<UserData>(context).currentUserId = snapshot.data.uid;
          String currentUserId = snapshot.data.uid;
          return BottomNavBar(currentUserId: currentUserId);
        } else {
          return SplashScreen();
        }
      },
    );
  } // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserData(),
      child: MaterialApp(
        title: 'Crpyto Cash',
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        home: _getScreenId(),
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          ProfilePage.id: (context) => ProfilePage(),
          BottomNavBar.id: (context) => BottomNavBar(),
        },
      ),
    );
  }
}
