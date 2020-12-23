import 'package:cloud_firestore/cloud_firestore.dart';

class Bynase {
  final String id;
  final String currentPrice;
  final String lastPrice;
  final String percent;

  Bynase({
    this.id,
    this.currentPrice,
    this.lastPrice,
    this.percent,
  });

  factory Bynase.fromDoc(DocumentSnapshot doc) {
    return Bynase(
      id: doc.documentID,
      currentPrice: doc['currentPrice'].toString(),
      lastPrice: doc['lastPrice'].toString(),
      percent: doc['percent'].toString(),
    );
  }
}
