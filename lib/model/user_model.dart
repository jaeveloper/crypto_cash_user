import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String profileImageUrl;
  final String email;
  final String bynaseAmt;
  final String bitcoinAmt;
  final String ethereumAmt;
  final String litecoinAmt;
  final String bitbotAmt;
  final String rippleAmt;
  final String cardanoAmt;
  final String stellarAmt;
  final String zainAmt;
  final String moneroAmt;

  User({
    this.id,
    this.name,
    this.profileImageUrl,
    this.email,
    this.bynaseAmt,
    this.bitcoinAmt,
    this.ethereumAmt,
    this.litecoinAmt,
    this.bitbotAmt,
    this.rippleAmt,
    this.cardanoAmt,
    this.stellarAmt,
    this.zainAmt,
    this.moneroAmt,
  });

  factory User.fromDoc(DocumentSnapshot doc) {
    return User(
      id: doc.documentID,
      name: doc['name'],
      profileImageUrl: doc['profileImageUrl'],
      email: doc['email'],
      bynaseAmt: doc['bynaseAmt'].toString(),
      bitcoinAmt: doc['bitcoinAmt'].toString(),
      ethereumAmt: doc['ethereumAmt'].toString(),
      litecoinAmt: doc['litecoinAmt'].toString(),
      bitbotAmt: doc['bitbotAmt'].toString(),
      rippleAmt: doc['rippleAmt'].toString(),
      cardanoAmt: doc['cardanoAmt'].toString(),
      stellarAmt: doc['stellarAmt'].toString(),
      zainAmt: doc['zainAmt'].toString(),
      moneroAmt: doc['moneroAmt'].toString(),
    );
  }
}
