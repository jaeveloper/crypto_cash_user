import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_cash_user/model/bitbot_model.dart';
import 'package:crypto_cash_user/model/bitcoin_model.dart';
import 'package:crypto_cash_user/model/bynase_model.dart';
import 'package:crypto_cash_user/model/cardano_model.dart';
import 'package:crypto_cash_user/model/coinRequest.dart';
import 'package:crypto_cash_user/model/ethereum_model.dart';
import 'package:crypto_cash_user/model/litecoin_model.dart';
import 'package:crypto_cash_user/model/monero_model.dart';
import 'package:crypto_cash_user/model/ripple_model.dart';
import 'package:crypto_cash_user/model/stellar_model.dart';
import 'package:crypto_cash_user/model/user_model.dart';
import 'package:crypto_cash_user/model/zain_model.dart';
import 'package:crypto_cash_user/screens/deposit.dart';
import 'package:crypto_cash_user/screens/edit_profile_screen.dart';
import 'package:crypto_cash_user/screens/history.dart';
import 'package:crypto_cash_user/screens/news_feed.dart';
import 'package:crypto_cash_user/screens/profile.dart';
import 'package:crypto_cash_user/screens/request.dart';
import 'package:crypto_cash_user/services/database_service.dart';
import 'package:crypto_cash_user/utilities/constants.dart';
import 'package:crypto_cash_user/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class HistRecieve extends StatefulWidget {
  final String currentUserId;
  final String userId;

  const HistRecieve({this.currentUserId, this.userId});

  @override
  _HistRecieveState createState() => _HistRecieveState();
}

class _HistRecieveState extends State<HistRecieve> {
  // Future<QuerySnapshot> _userRequest = DatabaseService.displayCoinRequest();

  _buildRequestTile(CoinRequest request) {
    return FutureBuilder(
        future: DatabaseService.getUserWithId(request.fromUserId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return SizedBox.shrink();
          }
          User user = snapshot.data;
          return Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: user.profileImageUrl.isEmpty
                    ? AssetImage('images/user_placeholder.jpg')
                    : CachedNetworkImageProvider(user.profileImageUrl),
              ),
              title: Text(
                user.name,
                style: TextStyle(
                  fontFamily: 'Bellany',
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              subtitle: Text(
                DateFormat.yMd().add_jm().format(request.timestamp.toDate()),
                style: TextStyle(color: Colors.white60),
              ),
              trailing: Container(
                width: MediaQuery.of(context).size.width / 3.763,
                height: MediaQuery.of(context).size.height / 23.57,
                decoration: BoxDecoration(
                    color: Colors.green[200],
                    /*border: Border.all(
                      color: Colors.white,
                    ),*/
                    borderRadius: BorderRadius.circular(6)),
                child: GestureDetector(
                  onTap: () {
                    // _submit(request, user);
                  },
                  child: Center(
                    child: Text(
                      request.amount + ' ' + request.coin,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.white54,
      appBar: AppBar(
        backgroundColor: Color(0xFF011143),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Text(
              'REQUEST HISTORY',
              style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w300,
                  fontSize: 16),
            ),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFF051928),
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: FutureBuilder(
            future: coinRequestRef
                .where('fromUserId', isEqualTo: widget.currentUserId)
                .getDocuments(), //_userRequest,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data.documents.length == 0) {
                return Center(
                  child: Text('No request found!'),
                );
              }
              CoinRequest request;
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) {
                  request = CoinRequest.fromDoc(
                    snapshot.data.documents[index],
                  );
                  return Dismissible(
                    background: Container(
                      color: Colors.red,
                      child: Icon(
                        Icons.delete,
                        size: 22,
                      ),
                    ),
                    key: Key(snapshot.data.documents[index].toString()),
                    onDismissed: (direction) {
                      String remove = CoinRequest.fromDoc(
                        snapshot.data.documents[index],
                      ).id;

                      setState(() {
                        DatabaseService.deleteCoinRequest(remove);
                        snapshot.data.documents.removeAt(index);
                      });

                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text("Deleted")));
                    },
                    child: _buildRequestTile(request),
                  );

                  //return _buildRequestTile(request);
                },
              );
            }),
      ),
    );
  }
}
