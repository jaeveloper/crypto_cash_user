import 'package:cloud_firestore/cloud_firestore.dart';

class Monero {
  final String id;
  final String currentPrice;
  final String lastPrice;
  final String percent;

  Monero({
    this.id,
    this.currentPrice,
    this.lastPrice,
    this.percent,
  });

  factory Monero.fromDoc(DocumentSnapshot doc) {
    return Monero(
      id: doc.documentID,
      currentPrice: doc['currentPrice'].toString(),
      lastPrice: doc['lastPrice'].toString(),
      percent: doc['percent'].toString(),
    );
  }
}
