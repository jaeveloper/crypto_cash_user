import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:crypto_cash_user/screens/decimalinput.dart';
import 'package:crypto_cash_user/screens/edit_profile_screen.dart';
import 'package:crypto_cash_user/screens/exBitbot.dart';
import 'package:crypto_cash_user/screens/exBitcoin.dart';
import 'package:crypto_cash_user/screens/exBynase.dart';
import 'package:crypto_cash_user/screens/exCardano.dart';
import 'package:crypto_cash_user/screens/exEthereum.dart';
import 'package:crypto_cash_user/screens/exLitecoin.dart';
import 'package:crypto_cash_user/screens/exMonero.dart';
import 'package:crypto_cash_user/screens/exRipple.dart';
import 'package:crypto_cash_user/screens/exStellar.dart';
import 'package:crypto_cash_user/screens/exZain.dart';
import 'package:crypto_cash_user/services/database_service.dart';
import 'package:crypto_cash_user/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class SendCoin extends StatefulWidget {
  final String currentUserId;
  final String userId;

  const SendCoin({this.currentUserId, this.userId});
  @override
  _SendCoinState createState() => _SendCoinState();
}

class _SendCoinState extends State<SendCoin> {
  bool _isLoading = false;
  String bynaseVal,
      bitcoinVal,
      ethereumVal,
      litecoinVal,
      bitbotVal,
      rippleVal,
      cardanoVal,
      stellarVal,
      zainVal,
      moneroVal,
      recieverAddress;
  String byn, btc, eth, ltc, btb, xrp, card, stl, zan, mnr;

  FlutterToast flutterToast;
  @override
  void initState() {
    super.initState();
    flutterToast = FlutterToast(context);
  }

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.grey[400],
      ),
      child: Text("Please request \$100 into USD account to start trading"),
    );

    flutterToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      // bottomNavigationBar: BottomNavBar(),
      appBar: new AppBar(
        backgroundColor: Color(0xFF011143),
        title: Center(
          child: Text(
            'SEND COIN',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontFamily: 'Billabong'),
          ),
        ),
      ),
      backgroundColor: Color(0xFF011143),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          children: <Widget>[
            _isLoading
                ? LinearProgressIndicator(
                    backgroundColor: Colors.blue[200],
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  )
                : SizedBox.shrink(),
            FutureBuilder(
                future: Firestore.instance
                    .collection('users')
                    .document(widget.userId)
                    .get(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  User user = User.fromDoc(snapshot.data);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 10,
                      ),
                      Container(
                        height: (MediaQuery.of(context).size.height / 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Your XXBASE Address :',
                              style: TextStyle(
                                fontFamily: 'Bellany',
                                color: Color(0xFFE0E0E0),
                                fontSize: 15.0,
                              ),
                            ),
                            Text(
                              user.id,
                              style: TextStyle(
                                fontFamily: 'Bellany',
                                color: Colors.green,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.65,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 21.0),
                                  child: Text(
                                    'TAP TO SEND COIN',
                                    style: TextStyle(
                                      fontFamily: 'Bellany',
                                      color: Colors.black87,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 44.5,
                                ),
                                FutureBuilder(
                                    future: zainRef.document('zain').get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.data == null) {
                                        return Container(
                                            width: 0.0, height: 0.0);
                                      }
                                      num usdCheck = int.parse(user.zainAmt);
                                      return GestureDetector(
                                        onTap: () {
                                          if (usdCheck != 0) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ExZain(
                                                    currentUserId:
                                                        widget.currentUserId,
                                                    userId:
                                                        widget.currentUserId),
                                              ),
                                            );
                                          } else {
                                            _showToast();
                                          }
                                        },
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Color(0xFFE0E0E0),
                                            backgroundImage:
                                                AssetImage("images/zain.jpg"),
                                          ),
                                          contentPadding: EdgeInsets.all(10),
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              // Text("${stock.symbol}",)
                                              Text("USD",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              // Text("${stock.company}")
                                              Text("${user.zainAmt}" + " USD",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 16))
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                Divider(color: Colors.grey[400]),
                                FutureBuilder(
                                    future: bynaseRef.document('bynase').get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.data == null) {
                                        return Container(
                                            width: 0.0, height: 0.0);
                                      }
                                      num usdCheck = int.parse(user.zainAmt);
                                      return GestureDetector(
                                        onTap: () {
                                          if (usdCheck != 0) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ExBynase(
                                                    currentUserId:
                                                        widget.currentUserId,
                                                    userId:
                                                        widget.currentUserId),
                                              ),
                                            );
                                          } else {
                                            _showToast();
                                          }
                                        },
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Color(0xFFE0E0E0),
                                            backgroundImage:
                                                AssetImage("images/bynase.jpg"),
                                          ),
                                          contentPadding: EdgeInsets.all(10),
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              // Text("${stock.symbol}",)
                                              Text("Bynase",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              // Text("${stock.company}")
                                              Text("${user.bynaseAmt}" + " BNC",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 16))
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                Divider(color: Colors.grey[400]),
                                FutureBuilder(
                                    future:
                                        bitcoinRef.document('bitcoin').get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.data == null) {
                                        return Container(
                                            width: 0.0, height: 0.0);
                                      }
                                      num usdCheck = int.parse(user.zainAmt);
                                      return GestureDetector(
                                        onTap: () {
                                          if (usdCheck != 0) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ExBitcoin(
                                                    currentUserId:
                                                        widget.currentUserId,
                                                    userId:
                                                        widget.currentUserId),
                                              ),
                                            );
                                          } else {
                                            _showToast();
                                          }
                                        },
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Colors.grey,
                                            backgroundImage: AssetImage(
                                                "images/bitcoin.png"),
                                          ),
                                          contentPadding: EdgeInsets.all(10),
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              // Text("${stock.symbol}",)
                                              Text("Bitcoin",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              // Text("${stock.company}")
                                              Text(
                                                  "${user.bitcoinAmt}" + " BTC",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 16))
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                Divider(color: Colors.grey[400]),
                                FutureBuilder(
                                    future:
                                        ethereumRef.document('ethereum').get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.data == null) {
                                        return Container(
                                            width: 0.0, height: 0.0);
                                      }
                                      num usdCheck = int.parse(user.zainAmt);
                                      return GestureDetector(
                                        onTap: () {
                                          if (usdCheck != 0) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ExEthereum(
                                                        currentUserId: widget
                                                            .currentUserId,
                                                        userId: widget
                                                            .currentUserId),
                                              ),
                                            );
                                          } else {
                                            _showToast();
                                          }
                                        },
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Color(0xFF4C99),
                                            backgroundImage: AssetImage(
                                                "images/ethereum.png"),
                                          ),
                                          contentPadding: EdgeInsets.all(10),
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              // Text("${stock.symbol}",)
                                              Text("Ethereum",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              // Text("${stock.company}")
                                              Text(
                                                  "${user.ethereumAmt}" +
                                                      " ETH",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 16))
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                Divider(color: Colors.grey[400]),
                                FutureBuilder(
                                    future:
                                        litecoinRef.document('litecoin').get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.data == null) {
                                        return Container(
                                            width: 0.0, height: 0.0);
                                      }
                                      num usdCheck = int.parse(user.zainAmt);
                                      return GestureDetector(
                                        onTap: () {
                                          if (usdCheck != 0) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ExLitecoin(
                                                        currentUserId: widget
                                                            .currentUserId,
                                                        userId: widget
                                                            .currentUserId),
                                              ),
                                            );
                                          } else {
                                            _showToast();
                                          }
                                        },
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Color(0xFFE0E0E0),
                                            backgroundImage: AssetImage(
                                                "images/litecoin.png"),
                                          ),
                                          contentPadding: EdgeInsets.all(10),
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              // Text("${stock.symbol}",)
                                              Text("Litecoin",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              // Text("${stock.company}")
                                              Text(
                                                  "${user.litecoinAmt}" +
                                                      " LTC",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 16))
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                Divider(color: Colors.grey[400]),
                                FutureBuilder(
                                    future: bitbotRef.document('bitbot').get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.data == null) {
                                        return Container(
                                            width: 0.0, height: 0.0);
                                      }
                                      num usdCheck = int.parse(user.zainAmt);
                                      return GestureDetector(
                                        onTap: () {
                                          if (usdCheck != 0) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ExBitbot(
                                                    currentUserId:
                                                        widget.currentUserId,
                                                    userId:
                                                        widget.currentUserId),
                                              ),
                                            );
                                          } else {
                                            _showToast();
                                          }
                                        },
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Colors.grey,
                                            backgroundImage: AssetImage(
                                                "images/bitcoincash.png"),
                                          ),
                                          contentPadding: EdgeInsets.all(10),
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              // Text("${stock.symbol}",)
                                              Text("BitBot",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              // Text("${stock.company}")
                                              Text("${user.bitbotAmt}" + " BiT",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 16))
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                Divider(color: Colors.grey[400]),
                                FutureBuilder(
                                    future: rippleRef.document('ripple').get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.data == null) {
                                        return Container(
                                            width: 0.0, height: 0.0);
                                      }
                                      num usdCheck = int.parse(user.zainAmt);
                                      return GestureDetector(
                                        onTap: () {
                                          if (usdCheck != 0) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ExRipple(
                                                    currentUserId:
                                                        widget.currentUserId,
                                                    userId:
                                                        widget.currentUserId),
                                              ),
                                            );
                                          } else {
                                            _showToast();
                                          }
                                        },
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Color(0xFFE0E0E0),
                                            backgroundImage: AssetImage(
                                                "images/ripples.png"),
                                          ),
                                          contentPadding: EdgeInsets.all(10),
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              // Text("${stock.symbol}",)
                                              Text("Ripple",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              // Text("${stock.company}")
                                              Text("${user.rippleAmt}" + " XRP",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 16))
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                Divider(color: Colors.grey[400]),
                                FutureBuilder(
                                    future:
                                        cardanoRef.document('cardano').get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.data == null) {
                                        return Container(
                                            width: 0.0, height: 0.0);
                                      }
                                      num usdCheck = int.parse(user.zainAmt);
                                      return GestureDetector(
                                        onTap: () {
                                          if (usdCheck != 0) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ExCardano(
                                                    currentUserId:
                                                        widget.currentUserId,
                                                    userId:
                                                        widget.currentUserId),
                                              ),
                                            );
                                          } else {
                                            _showToast();
                                          }
                                        },
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Color(0xFFE0E0E0),
                                            backgroundImage: AssetImage(
                                                "images/cardano.jpg"),
                                          ),
                                          contentPadding: EdgeInsets.all(10),
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              // Text("${stock.symbol}",)
                                              Text("Cardano",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              // Text("${stock.company}")
                                              Text(
                                                  "${user.cardanoAmt}" + " ADA",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 16))
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                Divider(color: Colors.grey[400]),
                                FutureBuilder(
                                    future:
                                        stellarRef.document('stellar').get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.data == null) {
                                        return Container(
                                            width: 0.0, height: 0.0);
                                      }
                                      num usdCheck = int.parse(user.zainAmt);
                                      return GestureDetector(
                                        onTap: () {
                                          if (usdCheck != 0) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ExStellar(
                                                    currentUserId:
                                                        widget.currentUserId,
                                                    userId:
                                                        widget.currentUserId),
                                              ),
                                            );
                                          } else {
                                            _showToast();
                                          }
                                        },
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Color(0xFFE0E0E0),
                                            backgroundImage: AssetImage(
                                                "images/steller.png"),
                                          ),
                                          contentPadding: EdgeInsets.all(10),
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              // Text("${stock.symbol}",)
                                              Text("Stellar",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              // Text("${stock.company}")
                                              Text(
                                                  "${user.stellarAmt}" + " XLM",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 16))
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                Divider(color: Colors.grey[400]),
                                FutureBuilder(
                                  future: moneroRef.document('monero').get(),
                                  builder: (context, snapshot) {
                                    if (snapshot.data == null) {
                                      return Container(width: 0.0, height: 0.0);
                                    }
                                    num usdCheck = int.parse(user.zainAmt);
                                    return GestureDetector(
                                      onTap: () {
                                        if (usdCheck != 0) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ExMonero(
                                                  currentUserId:
                                                      widget.currentUserId,
                                                  userId: widget.currentUserId),
                                            ),
                                          );
                                        } else {
                                          _showToast();
                                        }
                                      },
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: Color(0xFFE0E0E0),
                                          backgroundImage:
                                              AssetImage("images/monero.png"),
                                        ),
                                        contentPadding: EdgeInsets.all(10),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            // Text("${stock.symbol}",)
                                            Text("Monero",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            // Text("${stock.company}")
                                            Text("${user.moneroAmt}" + " XMR",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 16))
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Divider(color: Colors.grey[400]),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
