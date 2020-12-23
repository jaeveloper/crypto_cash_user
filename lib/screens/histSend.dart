import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_cash_user/model/bitbot_model.dart';
import 'package:crypto_cash_user/model/bitcoin_model.dart';
import 'package:crypto_cash_user/model/bynase_model.dart';
import 'package:crypto_cash_user/model/cardano_model.dart';
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
import 'package:crypto_cash_user/utilities/constants.dart';
import 'package:crypto_cash_user/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HistSend extends StatefulWidget {
  final String currentUserId;
  final String userId;

  const HistSend({this.currentUserId, this.userId});

  @override
  _HistSendState createState() => _HistSendState();
}

class _HistSendState extends State<HistSend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.white54,
      body: Center(
        child: Text('Send'),
      ),
    );
  }
}
