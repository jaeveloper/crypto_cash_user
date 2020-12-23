import 'package:cloud_firestore/cloud_firestore.dart';

class Zain {
  final String id;
  final String currentPrice;
  final String lastPrice;
  final String percent;

  Zain({
    this.id,
    this.currentPrice,
    this.lastPrice,
    this.percent,
  });

  factory Zain.fromDoc(DocumentSnapshot doc) {
    return Zain(
      id: doc.documentID,
      currentPrice: doc['currentPrice'].toString(),
      lastPrice: doc['lastPrice'].toString(),
      percent: doc['percent'].toString(),
    );
  }
}
