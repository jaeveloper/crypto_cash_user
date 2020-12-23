import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      // bottomNavigationBar: BottomNavBar(),
      appBar: AppBar(
        backgroundColor: Color(0xFF051928),
        title: Center(
          child: Text(
            'News Feed',
            style: TextStyle(
              fontFamily: 'Bellany',
              color: Color(0xFFE0E0E0),
              fontSize: 24.0,
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFF051928),
      body: Container(),
    );
  }
}
