import 'package:cloud_firestore/cloud_firestore.dart';

class BitBot {
  final String id;
  final String currentPrice;
  final String lastPrice;
  final String percent;

  BitBot({
    this.id,
    this.currentPrice,
    this.lastPrice,
    this.percent,
  });

  factory BitBot.fromDoc(DocumentSnapshot doc) {
    return BitBot(
      id: doc.documentID,
      currentPrice: doc['currentPrice'].toString(),
      lastPrice: doc['lastPrice'].toString(),
      percent: doc['percent'].toString(),
    );
  }
}
