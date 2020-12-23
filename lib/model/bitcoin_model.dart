import 'package:cloud_firestore/cloud_firestore.dart';

class Bitcoin {
  final String id;
  final String currentPrice;
  final String lastPrice;
  final String percent;

  Bitcoin({
    this.id,
    this.currentPrice,
    this.lastPrice,
    this.percent,
  });

  factory Bitcoin.fromDoc(DocumentSnapshot doc) {
    return Bitcoin(
      id: doc.documentID,
      currentPrice: doc['currentPrice'].toString(),
      lastPrice: doc['lastPrice'].toString(),
      percent: doc['percent'].toString(),
    );
  }
}
