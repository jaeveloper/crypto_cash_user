import 'package:cloud_firestore/cloud_firestore.dart';

class Cardano {
  final String id;
  final String currentPrice;
  final String lastPrice;
  final String percent;

  Cardano({
    this.id,
    this.currentPrice,
    this.lastPrice,
    this.percent,
  });

  factory Cardano.fromDoc(DocumentSnapshot doc) {
    return Cardano(
      id: doc.documentID,
      currentPrice: doc['currentPrice'].toString(),
      lastPrice: doc['lastPrice'].toString(),
      percent: doc['percent'].toString(),
    );
  }
}
