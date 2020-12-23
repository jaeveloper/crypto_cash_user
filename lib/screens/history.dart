import 'package:crypto_cash_user/screens/histRecieve.dart';
import 'package:crypto_cash_user/screens/histSend.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  final String currentUserId;
  final String userId;

  const History({this.currentUserId, this.userId});
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 1, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF545875),
      appBar: AppBar(
        backgroundColor: Color(0xFF011143),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Text(
              'HISTORY',
              style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w300,
                  fontSize: 16),
            ),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          unselectedLabelColor: Colors.white,
          labelColor: Color(0xFF323751),
          indicatorColor: Colors.indigo[400],
          indicatorPadding: EdgeInsets.only(left: 60, right: 60, bottom: 10),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 2,
          tabs: <Widget>[
            Tab(
              child: Center(
                child: Text(
                  'REQUESTED',
                  style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w200,
                      fontSize: 16),
                ),
              ),
            ),
            Tab(
              child: Center(
                child: Text(
                  'SENT',
                  style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w200,
                      fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          /*  HistRecieve(
            currentUserId: widget.currentUserId,
            userId: widget.currentUserId,
          ),*/
          //  HistSend(),
        ],
      ),
    );
  }
}
