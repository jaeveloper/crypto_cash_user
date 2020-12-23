import 'package:crypto_cash_user/model/user_data.dart';
import 'package:crypto_cash_user/screens/sendCoin.dart';
import 'package:crypto_cash_user/screens/home_balance.dart';
import 'package:crypto_cash_user/screens/news_feed.dart';
import 'package:crypto_cash_user/screens/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  final String currentUserId;

  const BottomNavBar({this.currentUserId});

  static final String id = 'navbar';
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentTab = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final String currentUserId = Provider.of<UserData>(context).currentUserId;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          //  FeedScreen(currentUserId: currentUserId),
          //   SearchScreen(),
          // CreatePostScreen(),
          //  ActivityScreen(currentUserId: currentUserId),
          //NewsFeed(),
          HomeBalance(
              currentUserId: widget.currentUserId,
              userId: widget.currentUserId),
          SendCoin(
              currentUserId: widget.currentUserId,
              userId: widget.currentUserId),
          ProfilePage(
              currentUserId: widget.currentUserId,
              userId: widget.currentUserId),

          //ProfileScreen(
          //  currentUserId: currentUserId,
          // userId: currentUserId,
          // ),
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        ),
        child: CupertinoTabBar(
          backgroundColor: Colors.lightBlue.shade50,
          border: Border(left: BorderSide(width: 0)),
          currentIndex: _currentTab,
          onTap: (int index) {
            setState(() {
              _currentTab = index;
            });
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn,
            );
          },
          activeColor: Colors.lightBlue,
          items: [
            /*  BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 26.0,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.receipt,
                size: 24.0,
              ),
            ),*/
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30.0,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.swap_horizontal_circle,
                size: 30.0,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 27.0,
              ),
            ),
            /*   BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 25.0,
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
