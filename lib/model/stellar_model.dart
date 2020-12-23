import 'package:cloud_firestore/cloud_firestore.dart';

class Stellar {
  final String id;
  final String currentPrice;
  final String lastPrice;
  final String percent;

  Stellar({
    this.id,
    this.currentPrice,
    this.lastPrice,
    this.percent,
  });

  factory Stellar.fromDoc(DocumentSnapshot doc) {
    return Stellar(
      id: doc.documentID,
      currentPrice: doc['currentPrice'].toString(),
      lastPrice: doc['lastPrice'].toString(),
      percent: doc['percent'].toString(),
    );
  }
}
