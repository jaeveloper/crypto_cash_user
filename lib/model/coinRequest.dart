import 'package:cloud_firestore/cloud_firestore.dart';

class CoinRequest {
  final String id;
  final String amount;
  final String coin;
  final String fromUserId;
  final Timestamp timestamp;

  CoinRequest({
    this.id,
    this.amount,
    this.coin,
    this.fromUserId,
    this.timestamp,
  });

  factory CoinRequest.fromDoc(DocumentSnapshot doc) {
    return CoinRequest(
      id: doc.documentID,
      amount: doc['amount'].toString(),
      coin: doc['coin'].toString(),
      fromUserId: doc['fromUserId'],
      timestamp: doc['timestamp'],
    );
  }
}
