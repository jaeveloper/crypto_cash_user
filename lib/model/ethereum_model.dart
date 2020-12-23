import 'package:cloud_firestore/cloud_firestore.dart';

class Ethereum {
  final String id;
  final String currentPrice;
  final String lastPrice;
  final String percent;

  Ethereum({
    this.id,
    this.currentPrice,
    this.lastPrice,
    this.percent,
  });

  factory Ethereum.fromDoc(DocumentSnapshot doc) {
    return Ethereum(
      id: doc.documentID,
      currentPrice: doc['currentPrice'].toString(),
      lastPrice: doc['lastPrice'].toString(),
      percent: doc['percent'].toString(),
    );
  }
}
