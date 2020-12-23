import 'package:cloud_firestore/cloud_firestore.dart';

class Litecoin {
  final String id;
  final String currentPrice;
  final String lastPrice;
  final String percent;

  Litecoin({
    this.id,
    this.currentPrice,
    this.lastPrice,
    this.percent,
  });

  factory Litecoin.fromDoc(DocumentSnapshot doc) {
    return Litecoin(
      id: doc.documentID,
      currentPrice: doc['currentPrice'].toString(),
      lastPrice: doc['lastPrice'].toString(),
      percent: doc['percent'].toString(),
    );
  }
}
