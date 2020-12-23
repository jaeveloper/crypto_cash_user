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
import 'package:crypto_cash_user/services/database_service.dart';
import 'package:crypto_cash_user/services/validations.dart';
import 'package:crypto_cash_user/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class SendRecieve extends StatefulWidget {
  final String currentUserId;
  final String userId;

  const SendRecieve({this.currentUserId, this.userId});
  @override
  _SendRecieveState createState() => _SendRecieveState();
}

class _SendRecieveState extends State<SendRecieve> {
  Validations validations = new Validations();
  final _bynaseformKey = GlobalKey<FormState>();
  final _bitcoinformKey = GlobalKey<FormState>();
  final _ethereumformKey = GlobalKey<FormState>();
  final _litecoinformKey = GlobalKey<FormState>();
  final _bitbotformKey = GlobalKey<FormState>();
  final _rippleformKey = GlobalKey<FormState>();
  final _cardanoformKey = GlobalKey<FormState>();
  final _stellarformKey = GlobalKey<FormState>();
  final _zainformKey = GlobalKey<FormState>();
  final _moneroformKey = GlobalKey<FormState>();

  // int _userCount = 0;
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
      moneroVal;
  String byn, btc, eth, ltc, btb, xrp, card, stl, zan, mnr;

  TextEditingController _searchController = TextEditingController();
  _setBynase(BuildContext context) async {
    if (_bynaseformKey.currentState.validate() && !_isLoading) {
      _bynaseformKey.currentState.save();
      print(bynaseVal);
      if (mounted) {
        setState(() {
          _isLoading = true;
        });
      }
      CoinRequest request = CoinRequest(
        amount: bynaseVal,
        coin: 'BNC',
        fromUserId: widget.currentUserId,
        timestamp: Timestamp.now(),
      );
      DatabaseService.setCoinRequest(request);
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Request Submitted")));
      _isLoading = false;
    }
  }

  _setBitcoin(BuildContext context) async {
    if (_bitcoinformKey.currentState.validate() && !_isLoading) {
      _bitcoinformKey.currentState.save();
      print(bitcoinVal);
      if (mounted) {
        setState(() {
          _isLoading = true;
        });
      }
      CoinRequest request = CoinRequest(
        amount: bitcoinVal,
        coin: 'BTC',
        fromUserId: widget.currentUserId,
        timestamp: Timestamp.now(),
      );
      DatabaseService.setCoinRequest(request);
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Request Submitted")));
      _isLoading = false;
    }
  }

  _setEthereum(BuildContext context) async {
    if (_ethereumformKey.currentState.validate() && !_isLoading) {
      _ethereumformKey.currentState.save();
      print(ethereumVal);
      if (mounted) {
        setState(() {
          _isLoading = true;
        });
      }
      CoinRequest request = CoinRequest(
        amount: ethereumVal,
        coin: 'ETH',
        fromUserId: widget.currentUserId,
        timestamp: Timestamp.now(),
      );
      DatabaseService.setCoinRequest(request);
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Request Submitted")));
      _isLoading = false;
    }
  }

  _setLitecoin(BuildContext context) async {
    if (_litecoinformKey.currentState.validate() && !_isLoading) {
      _litecoinformKey.currentState.save();
      print(litecoinVal);
      if (mounted) {
        setState(() {
          _isLoading = true;
        });
      }
      CoinRequest request = CoinRequest(
        amount: litecoinVal,
        coin: 'LTC',
        fromUserId: widget.currentUserId,
        timestamp: Timestamp.now(),
      );
      DatabaseService.setCoinRequest(request);

      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Request Submitted")));

      _isLoading = false;
    }
  }

  _setBitbot(BuildContext context) async {
    if (_bitbotformKey.currentState.validate() && !_isLoading) {
      _bitbotformKey.currentState.save();
      print(bitbotVal);
      if (mounted) {
        setState(() {
          _isLoading = true;
        });
      }
      CoinRequest request = CoinRequest(
        amount: bitbotVal,
        coin: 'BiT',
        fromUserId: widget.currentUserId,
        timestamp: Timestamp.now(),
      );
      DatabaseService.setCoinRequest(request);

      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Request Submitted")));
      _isLoading = false;
    }
  }

  _setRipple(BuildContext context) async {
    if (_rippleformKey.currentState.validate() && !_isLoading) {
      _rippleformKey.currentState.save();
      print(rippleVal);
      if (mounted) {
        setState(() {
          _isLoading = true;
        });
      }
      CoinRequest request = CoinRequest(
        amount: rippleVal,
        coin: 'XRP',
        fromUserId: widget.currentUserId,
        timestamp: Timestamp.now(),
      );
      DatabaseService.setCoinRequest(request);

      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Request Submitted")));
      _isLoading = false;
    }
  }

  _setCardano(BuildContext context) async {
    if (_cardanoformKey.currentState.validate() && !_isLoading) {
      _cardanoformKey.currentState.save();
      print(cardanoVal);
      if (mounted) {
        setState(() {
          _isLoading = true;
        });
      }
      CoinRequest request = CoinRequest(
        amount: cardanoVal,
        coin: 'ADA',
        fromUserId: widget.currentUserId,
        timestamp: Timestamp.now(),
      );
      DatabaseService.setCoinRequest(request);

      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Request Submitted")));
      _isLoading = false;
    }
  }

  _setStellar(BuildContext context) async {
    if (_stellarformKey.currentState.validate() && !_isLoading) {
      _stellarformKey.currentState.save();
      print(stellarVal);
      if (mounted) {
        setState(() {
          _isLoading = true;
        });
      }
      CoinRequest request = CoinRequest(
        amount: stellarVal,
        coin: 'XLM',
        fromUserId: widget.currentUserId,
        timestamp: Timestamp.now(),
      );
      DatabaseService.setCoinRequest(request);

      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Request Submitted")));
      _isLoading = false;
    }
  }

  _setZain(BuildContext context) async {
    if (_zainformKey.currentState.validate() && !_isLoading) {
      _zainformKey.currentState.save();
      print(zainVal);
      if (mounted) {
        setState(() {
          _isLoading = true;
        });
      }
      CoinRequest request = CoinRequest(
        amount: zainVal,
        coin: 'USD',
        fromUserId: widget.currentUserId,
        timestamp: Timestamp.now(),
      );
      DatabaseService.setCoinRequest(request);
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Request Submitted")));
      _isLoading = false;
    }
  }

  _setMonero(BuildContext context) async {
    if (_moneroformKey.currentState.validate() && !_isLoading) {
      _moneroformKey.currentState.save();
      print(moneroVal);
      if (mounted) {
        setState(() {
          _isLoading = true;
        });
      }
      CoinRequest request = CoinRequest(
        amount: moneroVal,
        coin: 'XMR',
        fromUserId: widget.currentUserId,
        timestamp: Timestamp.now(),
      );
      DatabaseService.setCoinRequest(request);

      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Request Submitted")));
      _isLoading = false;
    }
  }

  _clearSearch() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _searchController.clear());
  }

  @override
  Widget build(BuildContext context) {
    Validations validations = new Validations();
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      // bottomNavigationBar: BottomNavBar(),
      appBar: new AppBar(
        backgroundColor: Color(0xFF011143),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Text(
              'REQUEST COIN',
              style: TextStyle(
                  color: Colors.white, fontSize: 22, fontFamily: 'Billabong'),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFF011143),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: FutureBuilder(
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
                    height: MediaQuery.of(context).size.height / 6,
                  ),
                  FutureBuilder(
                      future: bynaseRef.document('bynase').get(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        Bynase bynase = Bynase.fromDoc(snapshot.data);
                        num bynCount = num.parse(user.bynaseAmt) *
                            num.parse(bynase.currentPrice);
                        return FutureBuilder(
                            future: bitcoinRef.document('bitcoin').get(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              Bitcoin bitcoin = Bitcoin.fromDoc(snapshot.data);
                              num btcCount = num.parse(user.bitcoinAmt) *
                                  num.parse(bitcoin.currentPrice);
                              return FutureBuilder(
                                  future:
                                      ethereumRef.document('ethereum').get(),
                                  builder: (context, snapshot) {
                                    if (snapshot.data == null) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    Ethereum ethereum =
                                        Ethereum.fromDoc(snapshot.data);
                                    num ethCount = num.parse(user.ethereumAmt) *
                                        num.parse(ethereum.currentPrice);
                                    return FutureBuilder(
                                        future: litecoinRef
                                            .document('litecoin')
                                            .get(),
                                        builder: (context, snapshot) {
                                          if (snapshot.data == null) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }
                                          Litecoin litecoin =
                                              Litecoin.fromDoc(snapshot.data);
                                          num ltcCount = num.parse(
                                                  user.litecoinAmt) *
                                              num.parse(litecoin.currentPrice);

                                          return FutureBuilder(
                                              future: bitbotRef
                                                  .document('bitbot')
                                                  .get(),
                                              builder: (context, snapshot) {
                                                if (snapshot.data == null) {
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                }
                                                BitBot bitBot = BitBot.fromDoc(
                                                    snapshot.data);
                                                num bitCount = num.parse(
                                                        user.bitbotAmt) *
                                                    num.parse(
                                                        bitBot.currentPrice);

                                                return FutureBuilder(
                                                    future: rippleRef
                                                        .document('ripple')
                                                        .get(),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (snapshot.data ==
                                                          null) {
                                                        return Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        );
                                                      }
                                                      Ripple ripple =
                                                          Ripple.fromDoc(
                                                              snapshot.data);
                                                      num ripCount = num.parse(
                                                              user.rippleAmt) *
                                                          num.parse(ripple
                                                              .currentPrice);
                                                      return FutureBuilder(
                                                          future: cardanoRef
                                                              .document(
                                                                  'cardano')
                                                              .get(),
                                                          builder: (context,
                                                              snapshot) {
                                                            if (snapshot.data ==
                                                                null) {
                                                              return Center(
                                                                child:
                                                                    CircularProgressIndicator(),
                                                              );
                                                            }
                                                            Cardano cardano =
                                                                Cardano.fromDoc(
                                                                    snapshot
                                                                        .data);
                                                            num cardCount = num
                                                                    .parse(user
                                                                        .cardanoAmt) *
                                                                num.parse(cardano
                                                                    .currentPrice);
                                                            return FutureBuilder(
                                                                future: stellarRef
                                                                    .document(
                                                                        'stellar')
                                                                    .get(),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  if (snapshot
                                                                          .data ==
                                                                      null) {
                                                                    return Center(
                                                                      child:
                                                                          CircularProgressIndicator(),
                                                                    );
                                                                  }
                                                                  Stellar
                                                                      stellar =
                                                                      Stellar.fromDoc(
                                                                          snapshot
                                                                              .data);
                                                                  num stellarCount = num
                                                                          .parse(user
                                                                              .stellarAmt) *
                                                                      num.parse(
                                                                          stellar
                                                                              .currentPrice);
                                                                  return FutureBuilder(
                                                                      future: zainRef
                                                                          .document(
                                                                              'zain')
                                                                          .get(),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        if (snapshot.data ==
                                                                            null) {
                                                                          return Center(
                                                                            child:
                                                                                CircularProgressIndicator(),
                                                                          );
                                                                        }
                                                                        Zain
                                                                            zain =
                                                                            Zain.fromDoc(snapshot.data);
                                                                        num zainCount =
                                                                            num.parse(user.zainAmt) *
                                                                                num.parse(zain.currentPrice);
                                                                        return FutureBuilder(
                                                                            future:
                                                                                moneroRef.document('monero').get(),
                                                                            builder: (context, snapshot) {
                                                                              if (snapshot.data == null) {
                                                                                return Center(
                                                                                  child: CircularProgressIndicator(),
                                                                                );
                                                                              }
                                                                              Monero monero = Monero.fromDoc(snapshot.data);
                                                                              num moneroCount = num.parse(user.moneroAmt) * num.parse(monero.currentPrice);
                                                                              num total = (btcCount + bynCount + ethCount + ltcCount + bitCount + ripCount + cardCount + stellarCount + zainCount + moneroCount);
                                                                              return Container(
                                                                                height: (MediaQuery.of(context).size.height / 5),
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: <Widget>[
                                                                                    Text(
                                                                                      'Total Amount:',
                                                                                      style: TextStyle(
                                                                                        fontFamily: 'Bellany',
                                                                                        color: Color(0xFFE0E0E0),
                                                                                        fontSize: 15.0,
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      '\$ ' + total.toStringAsFixed(2),
                                                                                      style: TextStyle(
                                                                                        fontFamily: 'Bellany',
                                                                                        color: Colors.green,
                                                                                        fontSize: 30.0,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            });
                                                                      });
                                                                });
                                                          });
                                                    });
                                              });
                                        });
                                  });
                            });
                      }),
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
                            FutureBuilder(
                                future: zainRef.document('zain').get(),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return Container(width: 0.0, height: 0.0);
                                  }
                                  return ListTile(
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
                                                fontWeight: FontWeight.w500)),
                                        // Text("${stock.company}")
                                        Text("${user.zainAmt}" + " USD",
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 16))
                                      ],
                                    ),
                                    trailing: Form(
                                      key: _zainformKey,
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4.2,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                23,
                                            child: TextFormField(
                                              keyboardType: TextInputType
                                                  .numberWithOptions(
                                                      decimal: true),
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    12),
                                                DecimalTextInputFormatter(
                                                    decimalRange: 2),
                                              ],
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                hintText: 'Amount',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[400],
                                                    fontSize: 13),
                                                contentPadding:
                                                    new EdgeInsets.only(
                                                        left: 4, right: 4),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0)),
                                              ),
                                              validator:
                                                  validations.validateNumber,
                                              onSaved: (input) =>
                                                  zainVal = input,
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  100),
                                          GestureDetector(
                                            onTap: () {
                                              _setZain(context);
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  46,
                                              decoration: BoxDecoration(
                                                  color: Colors.green[300],
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              child: Center(
                                                child: Icon(
                                                  Icons.done,
                                                  size: 16,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
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
                                    return Container(width: 0.0, height: 0.0);
                                  }
                                  return ListTile(
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
                                                fontWeight: FontWeight.w500)),
                                        // Text("${stock.company}")
                                        Text("${user.bynaseAmt}" + " BNC",
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 16))
                                      ],
                                    ),
                                    trailing: Form(
                                      key: _bynaseformKey,
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4.2,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                23,
                                            child: TextFormField(
                                              keyboardType: TextInputType
                                                  .numberWithOptions(
                                                      decimal: true),
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    12),
                                                DecimalTextInputFormatter(
                                                    decimalRange: 2),
                                              ],
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                hintText: 'Amount',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[400],
                                                    fontSize: 13),
                                                contentPadding:
                                                    new EdgeInsets.only(
                                                        left: 4, right: 4),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0)),
                                              ),
                                              validator:
                                                  validations.validateNumber,
                                              onSaved: (input) =>
                                                  bynaseVal = input,
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  100),
                                          GestureDetector(
                                            onTap: () {
                                              _setBynase(context);
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  46,
                                              decoration: BoxDecoration(
                                                  color: Colors.green[300],
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              child: Center(
                                                child: Icon(
                                                  Icons.done,
                                                  size: 16,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            Divider(color: Colors.grey[400]),
                            FutureBuilder(
                                future: bitcoinRef.document('bitcoin').get(),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return Container(width: 0.0, height: 0.0);
                                  }
                                  return ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      backgroundImage:
                                          AssetImage("images/bitcoin.png"),
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
                                                fontWeight: FontWeight.w500)),
                                        // Text("${stock.company}")
                                        Text("${user.bitcoinAmt}" + " BTC",
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 16))
                                      ],
                                    ),
                                    trailing: Form(
                                      key: _bitcoinformKey,
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4.2,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                23,
                                            child: TextFormField(
                                              keyboardType: TextInputType
                                                  .numberWithOptions(
                                                      decimal: true),
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    12),
                                                DecimalTextInputFormatter(
                                                    decimalRange: 2),
                                              ],
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                hintText: 'Amount',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[400],
                                                    fontSize: 13),
                                                contentPadding:
                                                    new EdgeInsets.only(
                                                        left: 4, right: 4),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0)),
                                              ),
                                              validator:
                                                  validations.validateNumber,
                                              onSaved: (input) =>
                                                  bitcoinVal = input,
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  100),
                                          GestureDetector(
                                            onTap: () {
                                              _setBitcoin(context);
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  46,
                                              decoration: BoxDecoration(
                                                  color: Colors.green[300],
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              child: Center(
                                                child: Icon(
                                                  Icons.done,
                                                  size: 16,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            Divider(color: Colors.grey[400]),
                            FutureBuilder(
                                future: ethereumRef.document('ethereum').get(),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return Container(width: 0.0, height: 0.0);
                                  }
                                  return ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Color(0xFF4C99),
                                      backgroundImage:
                                          AssetImage("images/ethereum.png"),
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
                                                fontWeight: FontWeight.w500)),
                                        // Text("${stock.company}")
                                        Text("${user.ethereumAmt}" + " ETH",
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 16))
                                      ],
                                    ),
                                    trailing: Form(
                                      key: _ethereumformKey,
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4.2,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                23,
                                            child: TextFormField(
                                              keyboardType: TextInputType
                                                  .numberWithOptions(
                                                      decimal: true),
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    12),
                                                DecimalTextInputFormatter(
                                                    decimalRange: 2),
                                              ],
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                hintText: 'Amount',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[400],
                                                    fontSize: 13),
                                                contentPadding:
                                                    new EdgeInsets.only(
                                                        left: 4, right: 4),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0)),
                                              ),
                                              validator:
                                                  validations.validateNumber,
                                              onSaved: (input) =>
                                                  ethereumVal = input,
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  100),
                                          GestureDetector(
                                            onTap: () {
                                              _setEthereum(context);
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  46,
                                              decoration: BoxDecoration(
                                                  color: Colors.green[300],
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              child: Center(
                                                child: Icon(
                                                  Icons.done,
                                                  size: 16,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            Divider(color: Colors.grey[400]),
                            FutureBuilder(
                                future: litecoinRef.document('litecoin').get(),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return Container(width: 0.0, height: 0.0);
                                  }
                                  return ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Color(0xFFE0E0E0),
                                      backgroundImage:
                                          AssetImage("images/litecoin.png"),
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
                                                fontWeight: FontWeight.w500)),
                                        // Text("${stock.company}")
                                        Text("${user.litecoinAmt}" + " LTC",
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 16))
                                      ],
                                    ),
                                    trailing: Form(
                                      key: _litecoinformKey,
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4.2,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                23,
                                            child: TextFormField(
                                              keyboardType: TextInputType
                                                  .numberWithOptions(
                                                      decimal: true),
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    12),
                                                DecimalTextInputFormatter(
                                                    decimalRange: 2),
                                              ],
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                hintText: 'Amount',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[400],
                                                    fontSize: 13),
                                                contentPadding:
                                                    new EdgeInsets.only(
                                                        left: 4, right: 4),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0)),
                                              ),
                                              validator:
                                                  validations.validateNumber,
                                              onSaved: (input) =>
                                                  litecoinVal = input,
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  100),
                                          GestureDetector(
                                            onTap: () {
                                              _setLitecoin(context);
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  46,
                                              decoration: BoxDecoration(
                                                  color: Colors.green[300],
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              child: Center(
                                                child: Icon(
                                                  Icons.done,
                                                  size: 16,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
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
                                    return Container(width: 0.0, height: 0.0);
                                  }
                                  return ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      backgroundImage:
                                          AssetImage("images/bitcoincash.png"),
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
                                                fontWeight: FontWeight.w500)),
                                        // Text("${stock.company}")
                                        Text("${user.bitbotAmt}" + " BiT",
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 16))
                                      ],
                                    ),
                                    trailing: Form(
                                      key: _bitbotformKey,
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4.2,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                23,
                                            child: TextFormField(
                                              keyboardType: TextInputType
                                                  .numberWithOptions(
                                                      decimal: true),
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    12),
                                                DecimalTextInputFormatter(
                                                    decimalRange: 2),
                                              ],
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                hintText: 'Amount',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[400],
                                                    fontSize: 13),
                                                contentPadding:
                                                    new EdgeInsets.only(
                                                        left: 4, right: 4),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0)),
                                              ),
                                              validator:
                                                  validations.validateNumber,
                                              onSaved: (input) =>
                                                  bitbotVal = input,
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  100),
                                          GestureDetector(
                                            onTap: () {
                                              _setBitbot(context);
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  46,
                                              decoration: BoxDecoration(
                                                  color: Colors.green[300],
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              child: Center(
                                                child: Icon(
                                                  Icons.done,
                                                  size: 16,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
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
                                    return Container(width: 0.0, height: 0.0);
                                  }
                                  return ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Color(0xFFE0E0E0),
                                      backgroundImage:
                                          AssetImage("images/ripples.png"),
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
                                                fontWeight: FontWeight.w500)),
                                        // Text("${stock.company}")
                                        Text("${user.rippleAmt}" + " XRP",
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 16))
                                      ],
                                    ),
                                    trailing: Form(
                                      key: _rippleformKey,
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4.2,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                23,
                                            child: TextFormField(
                                              keyboardType: TextInputType
                                                  .numberWithOptions(
                                                      decimal: true),
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    12),
                                                DecimalTextInputFormatter(
                                                    decimalRange: 2),
                                              ],
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                hintText: 'Amount',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[400],
                                                    fontSize: 13),
                                                contentPadding:
                                                    new EdgeInsets.only(
                                                        left: 4, right: 4),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0)),
                                              ),
                                              validator:
                                                  validations.validateNumber,
                                              onSaved: (input) =>
                                                  rippleVal = input,
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  100),
                                          GestureDetector(
                                            onTap: () {
                                              _setRipple(context);
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  46,
                                              decoration: BoxDecoration(
                                                  color: Colors.green[300],
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              child: Center(
                                                child: Icon(
                                                  Icons.done,
                                                  size: 16,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            Divider(color: Colors.grey[400]),
                            FutureBuilder(
                                future: cardanoRef.document('cardano').get(),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return Container(width: 0.0, height: 0.0);
                                  }
                                  return ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Color(0xFFE0E0E0),
                                      backgroundImage:
                                          AssetImage("images/cardano.jpg"),
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
                                                fontWeight: FontWeight.w500)),
                                        // Text("${stock.company}")
                                        Text("${user.cardanoAmt}" + " ADA",
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 16))
                                      ],
                                    ),
                                    trailing: Form(
                                      key: _cardanoformKey,
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4.2,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                23,
                                            child: TextFormField(
                                              keyboardType: TextInputType
                                                  .numberWithOptions(
                                                      decimal: true),
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    12),
                                                DecimalTextInputFormatter(
                                                    decimalRange: 2),
                                              ],
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                hintText: 'Amount',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[400],
                                                    fontSize: 13),
                                                contentPadding:
                                                    new EdgeInsets.only(
                                                        left: 4, right: 4),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0)),
                                              ),
                                              validator:
                                                  validations.validateNumber,
                                              onSaved: (input) =>
                                                  cardanoVal = input,
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  100),
                                          GestureDetector(
                                            onTap: () {
                                              _setCardano(context);
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  46,
                                              decoration: BoxDecoration(
                                                  color: Colors.green[300],
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              child: Center(
                                                child: Icon(
                                                  Icons.done,
                                                  size: 16,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            Divider(color: Colors.grey[400]),
                            FutureBuilder(
                                future: stellarRef.document('stellar').get(),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return Container(width: 0.0, height: 0.0);
                                  }
                                  return ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Color(0xFFE0E0E0),
                                      backgroundImage:
                                          AssetImage("images/steller.png"),
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
                                                fontWeight: FontWeight.w500)),
                                        // Text("${stock.company}")
                                        Text("${user.stellarAmt}" + " XLM",
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 16))
                                      ],
                                    ),
                                    trailing: Form(
                                      key: _stellarformKey,
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4.2,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                23,
                                            child: TextFormField(
                                              keyboardType: TextInputType
                                                  .numberWithOptions(
                                                      decimal: true),
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    12),
                                                DecimalTextInputFormatter(
                                                    decimalRange: 2),
                                              ],
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                hintText: 'Amount',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[400],
                                                    fontSize: 13),
                                                contentPadding:
                                                    new EdgeInsets.only(
                                                        left: 4, right: 4),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0)),
                                              ),
                                              validator:
                                                  validations.validateNumber,
                                              onSaved: (input) =>
                                                  stellarVal = input,
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  100),
                                          GestureDetector(
                                            onTap: () {
                                              _setStellar(context);
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  46,
                                              decoration: BoxDecoration(
                                                  color: Colors.green[300],
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              child: Center(
                                                child: Icon(
                                                  Icons.done,
                                                  size: 16,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
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
                                return ListTile(
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
                                              fontWeight: FontWeight.w500)),
                                      // Text("${stock.company}")
                                      Text("${user.moneroAmt}" + " XMR",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16))
                                    ],
                                  ),
                                  trailing: Form(
                                    key: _moneroformKey,
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4.2,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              23,
                                          child: TextFormField(
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    decimal: true),
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  12),
                                              DecimalTextInputFormatter(
                                                  decimalRange: 2),
                                            ],
                                            style: new TextStyle(
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              hintText: 'Amount',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[400],
                                                  fontSize: 13),
                                              contentPadding:
                                                  new EdgeInsets.only(
                                                      left: 4, right: 4),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0)),
                                            ),
                                            validator:
                                                validations.validateNumber,
                                            onSaved: (input) =>
                                                moneroVal = input,
                                          ),
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4.2,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                100),
                                        GestureDetector(
                                          onTap: () {
                                            _setMonero(context);
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4.2,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                46,
                                            decoration: BoxDecoration(
                                                color: Colors.green[300],
                                                borderRadius:
                                                    BorderRadius.circular(3)),
                                            child: Center(
                                              child: Icon(
                                                Icons.done,
                                                size: 16,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
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
      ),
    );
  }
}
