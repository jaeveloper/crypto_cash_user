import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_cash_user/model/bitbot_model.dart';
import 'package:crypto_cash_user/model/bitcoin_model.dart';
import 'package:crypto_cash_user/model/bynase_model.dart';
import 'package:crypto_cash_user/model/cardano_model.dart';
import 'package:crypto_cash_user/model/coinRequest.dart';
import 'package:crypto_cash_user/model/ethereum_model.dart';
import 'package:crypto_cash_user/model/litecoin_model.dart';
import 'package:crypto_cash_user/model/monero_model.dart';
import 'package:crypto_cash_user/model/ripple_model.dart';
import 'package:crypto_cash_user/model/stellar_model.dart';
import 'package:crypto_cash_user/model/user_model.dart';
import 'package:crypto_cash_user/model/zain_model.dart';
import 'package:crypto_cash_user/utilities/constants.dart';

class DatabaseService {
  static void updateUser(User user) {
    usersRef.document(user.id).updateData({
      'name': user.name,
      'profileImageUrl': user.profileImageUrl,
    });
  }

  static void setCoinRequest(CoinRequest request) {
    coinRequestRef.document().setData({
      'amount': request.amount,
      'coin': request.coin,
      'fromUserId': request.fromUserId,
      'timestamp': request.timestamp,
    });
  }

  static Future<QuerySnapshot> displayUsers() {
    Future<QuerySnapshot> users = usersRef.getDocuments();
    return users;
  }

  static Future<User> getUserWithId(String userId) async {
    DocumentSnapshot userDocSnapshot = await usersRef.document(userId).get();
    if (userDocSnapshot.exists) {
      return User.fromDoc(userDocSnapshot);
    }
    return User();
  }

  static Future<Bynase> getBynase() async {
    DocumentSnapshot bynaseSnapshot = await bynaseRef.document().get();
    if (bynaseSnapshot.exists) {
      return Bynase.fromDoc(bynaseSnapshot);
    }
    return Bynase();
  }

  static Future<Bitcoin> getBitcoin() async {
    DocumentSnapshot bitcoinSnapshot = await bitcoinRef.document().get();
    if (bitcoinSnapshot.exists) {
      return Bitcoin.fromDoc(bitcoinSnapshot);
    }
    return Bitcoin();
  }

  static Future<Ethereum> getEthereum() async {
    DocumentSnapshot ethereumSnapshot = await ethereumRef.document().get();
    if (ethereumSnapshot.exists) {
      return Ethereum.fromDoc(ethereumSnapshot);
    }
    return Ethereum();
  }

  static Future<Litecoin> getLitecoin() async {
    DocumentSnapshot litecoinSnapshot = await litecoinRef.document().get();
    if (litecoinSnapshot.exists) {
      return Litecoin.fromDoc(litecoinSnapshot);
    }
    return Litecoin();
  }

  static Future<BitBot> getBitBot() async {
    DocumentSnapshot bitBotSnapshot = await bitbotRef.document().get();
    if (bitBotSnapshot.exists) {
      return BitBot.fromDoc(bitBotSnapshot);
    }
    return BitBot();
  }

  static Future<Ripple> getRipple() async {
    DocumentSnapshot rippleSnapshot = await rippleRef.document().get();
    if (rippleSnapshot.exists) {
      return Ripple.fromDoc(rippleSnapshot);
    }
    return Ripple();
  }

  static Future<Cardano> getCardano() async {
    DocumentSnapshot cardanoSnapshot = await cardanoRef.document().get();
    if (cardanoSnapshot.exists) {
      return Cardano.fromDoc(cardanoSnapshot);
    }
    return Cardano();
  }

  static Future<Stellar> getStellar() async {
    DocumentSnapshot stellarSnapshot = await stellarRef.document().get();
    if (stellarSnapshot.exists) {
      return Stellar.fromDoc(stellarSnapshot);
    }
    return Stellar();
  }

  static Future<Zain> getZain() async {
    DocumentSnapshot zainSnapshot = await zainRef.document().get();
    if (zainSnapshot.exists) {
      return Zain.fromDoc(zainSnapshot);
    }
    return Zain();
  }

  static Future<Monero> getMonero() async {
    DocumentSnapshot moneroSnapshot = await moneroRef.document().get();
    if (moneroSnapshot.exists) {
      return Monero.fromDoc(moneroSnapshot);
    }
    return Monero();
  }

  static Future<QuerySnapshot> displayCoinRequest(userId) {
    Future<QuerySnapshot> userBynaseReqSnapshot = coinRequestRef
        .where('fromUserId' == userId)
        .orderBy('timestamp', descending: true)
        .getDocuments();
    return userBynaseReqSnapshot;
  }

  static void deleteCoinRequest(remove) {
    coinRequestRef.document(remove).delete();
  }

  static void updateBynaseCoin(User user) {
    usersRef.document(user.id).updateData({
      'bynaseAmt': user.bynaseAmt,
    });
  }

  static void updateBitcoinCoin(User user) {
    usersRef.document(user.id).updateData({
      'bitcoinAmt': user.bitcoinAmt,
    });
  }

  static void updateEthereumCoin(User user) {
    usersRef.document(user.id).updateData({
      'ethereumAmt': user.ethereumAmt,
    });
  }

  static void updateLitecoinCoin(User user) {
    usersRef.document(user.id).updateData({
      'litecoinAmt': user.litecoinAmt,
    });
  }

  static void updateBitbotCoin(User user) {
    usersRef.document(user.id).updateData({
      'bitbotAmt': user.bitbotAmt,
    });
  }

  static void updateRippleCoin(User user) {
    usersRef.document(user.id).updateData({
      'rippleAmt': user.rippleAmt,
    });
  }

  static void updateCardanoCoin(User user) {
    usersRef.document(user.id).updateData({
      'cardanoAmt': user.cardanoAmt,
    });
  }

  static void updateStellarCoin(User user) {
    usersRef.document(user.id).updateData({
      'stellarAmt': user.stellarAmt,
    });
  }

  static void updateZainCoin(User user) {
    usersRef.document(user.id).updateData({
      'zainAmt': user.zainAmt,
    });
  }

  static void updateMoneroCoin(User user) {
    usersRef.document(user.id).updateData({
      'moneroAmt': user.moneroAmt,
    });
  }

  /*  static void createPost(Post post) {
    postsRef.document(post.authorId).collection('userPosts').add({
      'imageUrl': post.imageUrl,
      'caption': post.caption,
      'likeCount': post.likeCount,
      'authorId': post.authorId,
      'timestamp': post.timestamp,
    });
  }

  static void followUser({String currentUserId, String userId}) {
    // Add user to current user's following collection
    followingRef
        .document(currentUserId)
        .collection('userFollowing')
        .document(userId)
        .setData({});
    // Add current user to user's followers collection
    followersRef
        .document(userId)
        .collection('userFollowers')
        .document(currentUserId)
        .setData({});
  }

  static void unfollowUser({String currentUserId, String userId}) {
    // Remove user from current user's following collection
    followingRef
        .document(currentUserId)
        .collection('userFollowing')
        .document(userId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // Remove current user from user's followers collection
    followersRef
        .document(userId)
        .collection('userFollowers')
        .document(currentUserId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
  }

  static Future<bool> isFollowingUser(
      {String currentUserId, String userId}) async {
    DocumentSnapshot followingDoc = await followersRef
        .document(userId)
        .collection('userFollowers')
        .document(currentUserId)
        .get();
    return followingDoc.exists;
  }

  static Future<int> numFollowing(String userId) async {
    QuerySnapshot followingSnapshot = await followingRef
        .document(userId)
        .collection('userFollowing')
        .getDocuments();
    return followingSnapshot.documents.length;
  }

  static Future<int> numFollowers(String userId) async {
    QuerySnapshot followersSnapshot = await followersRef
        .document(userId)
        .collection('userFollowers')
        .getDocuments();
    return followersSnapshot.documents.length;
  }

  static Future<List<Post>> getFeedPosts(String userId) async {
    QuerySnapshot feedSnapshot = await feedsRef
        .document(userId)
        .collection('userFeed')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    List<Post> posts =
        feedSnapshot.documents.map((doc) => Post.fromDoc(doc)).toList();
    return posts;
  }

  static Future<List<Post>> getUserPosts(String userId) async {
    QuerySnapshot userPostsSnapshot = await postsRef
        .document(userId)
        .collection('userPosts')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    List<Post> posts =
        userPostsSnapshot.documents.map((doc) => Post.fromDoc(doc)).toList();
    return posts;
  }

  static Future<User> getUserWithId(String userId) async {
    DocumentSnapshot userDocSnapshot = await usersRef.document(userId).get();
    if (userDocSnapshot.exists) {
      return User.fromDoc(userDocSnapshot);
    }
    return User();
  }

  static void likePost({String currentUserId, Post post}) {
    DocumentReference postRef = postsRef
        .document(post.authorId)
        .collection('userPosts')
        .document(post.id);
    postRef.get().then((doc) {
      int likeCount = doc.data['likeCount'];
      postRef.updateData({'likeCount': likeCount + 1});
      likesRef
          .document(post.id)
          .collection('postLikes')
          .document(currentUserId)
          .setData({});
      addActivityItem(currentUserId: currentUserId, post: post, comment: null);
    });
  }

  static void unlikePost({String currentUserId, Post post}) {
    DocumentReference postRef = postsRef
        .document(post.authorId)
        .collection('userPosts')
        .document(post.id);
    postRef.get().then((doc) {
      int likeCount = doc.data['likeCount'];
      postRef.updateData({'likeCount': likeCount - 1});
      likesRef
          .document(post.id)
          .collection('postLikes')
          .document(currentUserId)
          .get()
          .then((doc) {
        if (doc.exists) {
          doc.reference.delete();
        }
      });
    });
  }

  static Future<bool> didLikePost({String currentUserId, Post post}) async {
    DocumentSnapshot userDoc = await likesRef
        .document(post.id)
        .collection('postLikes')
        .document(currentUserId)
        .get();
    return userDoc.exists;
  }

  static void commentOnPost(
      {String currentUserId, Post post, String comment}) {
    commentsRef.document(post.id).collection('postComments').add({
      'content': comment,
      'authorId': currentUserId,
      'timestamp': Timestamp.fromDate(DateTime.now()),
    });
    addActivityItem(currentUserId: currentUserId, post: post, comment: comment);
  }

  static void addActivityItem(
      {String currentUserId, Post post, String comment}) {
    if (currentUserId != post.authorId) {
      activitiesRef.document(post.authorId).collection('userActivities').add({
        'fromUserId': currentUserId,
        'postId': post.id,
        'postImageUrl': post.imageUrl,
        'comment': comment,
        'timestamp': Timestamp.fromDate(DateTime.now()),
      });
    }
  }

  static Future<List<Activity>> getActivities(String userId) async {
    QuerySnapshot userActivitiesSnapshot = await activitiesRef
        .document(userId)
        .collection('userActivities')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    List<Activity> activity = userActivitiesSnapshot.documents
        .map((doc) => Activity.fromDoc(doc))
        .toList();
    return activity;
  }

  static Future<Post> getUserPost(String userId, String postId) async {
    DocumentSnapshot postDocSnapshot = await postsRef
        .document(userId)
        .collection('userPosts')
        .document(postId)
        .get();
    return Post.fromDoc(postDocSnapshot);
  }
*/
}
