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
class ExZain extends StatefulWidget {
  final String currentUserId;
  final String userId;

  const ExZain({this.currentUserId, this.userId});
  @override
  _ExZainState createState() => _ExZainState();
}

class _ExZainState extends State<ExZain> {
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
      moneroVal,
      recieverAddress;
  String byn, btc, eth, ltc, btb, xrp, card, stl, zan, mnr;

  TextEditingController _searchController = TextEditingController();

  _setBynase() async {
    if (_bynaseformKey.currentState.validate() && !_isLoading) {
      _bynaseformKey.currentState.save();
      print(recieverAddress);
      print(bynaseVal);
      print('object');
      if (mounted) {
        setState(() {
          _isLoading = true;
        });
      }
      User olduser = await DatabaseService.getUserWithId(widget.currentUserId);
      if (int.parse(olduser.bynaseAmt) > int.parse(bynaseVal)) {
        User setolduser = User(
          id: olduser.id,
          bynaseAmt:
              (int.parse(olduser.bynaseAmt) - int.parse(bynaseVal)).toString(),
        );
        DatabaseService.updateBynaseCoin(setolduser);
        User newuser = await DatabaseService.getUserWithId(recieverAddress);
        User setnewuser = User(
          id: newuser.id,
          bynaseAmt:
              (int.parse(newuser.bynaseAmt) + int.parse(bynaseVal)).toString(),
        );
        DatabaseService.updateBynaseCoin(setnewuser);
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Request Submitted")));
        TextEditingController().clear();
      } else {
        FocusScope.of(context).unfocus();
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Request")));
      }
    }
  }

  _setBitcoin() async {
    if (_bitcoinformKey.currentState.validate() && !_isLoading) {
      _bitcoinformKey.currentState.save();
      print(recieverAddress);
      print(bitcoinVal);
      print('object');
      if (mounted) {
        setState(() {
          _isLoading = true;
        });
      }
      User olduser = await DatabaseService.getUserWithId(widget.currentUserId);
      if (int.parse(olduser.bitcoinAmt) > int.parse(bitcoinVal)) {
        User setolduser = User(
          id: olduser.id,
          bitcoinAmt: (int.parse(olduser.bitcoinAmt) - int.parse(bitcoinVal))
              .toString(),
        );
        DatabaseService.updateBitcoinCoin(setolduser);
        User newuser = await DatabaseService.getUserWithId(recieverAddress);
        User setnewuser = User(
          id: newuser.id,
          bitcoinAmt: (int.parse(newuser.bitcoinAmt) + int.parse(bitcoinVal))
              .toString(),
        );
        DatabaseService.updateBitcoinCoin(setnewuser);
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Request Submitted")));
        TextEditingController().clear();
      } else {
        FocusScope.of(context).unfocus();
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Request")));
      }
    }
  }

  _setEthereum() async {
    if (_ethereumformKey.currentState.validate() && !_isLoading) {
      _ethereumformKey.currentState.save();
      print(recieverAddress);
      print(ethereumVal);
      print('object');
      if (mounted) {
        setState(() {
          _isLoading = true;
        });
      }
      User olduser = await DatabaseService.getUserWithId(widget.currentUserId);
      if (int.parse(olduser.ethereumAmt) > int.parse(ethereumVal)) {
        User setolduser = User(
          id: olduser.id,
          ethereumAmt: (int.parse(olduser.ethereumAmt) - int.parse(ethereumVal))
              .toString(),
        );
        DatabaseService.updateEthereumCoin(setolduser);
        User newuser = await DatabaseService.getUserWithId(recieverAddress);
        User setnewuser = User(
          id: newuser.id,
          ethereumAmt: (int.parse(newuser.ethereumAmt) + int.parse(ethereumVal))
              .toString(),
        );
        DatabaseService.updateEthereumCoin(setnewuser);
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Request Submitted")));
        TextEditingController().clear();
      } else {
        FocusScope.of(context).unfocus();
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Request")));
      }
    }
  }

  _setLitecoin() async {
    if (_litecoinformKey.currentState.validate() && !_isLoading) {
      _litecoinformKey.currentState.save();
      print(recieverAddress);
      print(litecoinVal);
      print('object');
      if (mounted) {
        setState(() {
          _isLoading = true;
        });
      }
      User olduser = await DatabaseService.getUserWithId(widget.currentUserId);
      if (int.parse(olduser.litecoinAmt) > int.parse(litecoinVal)) {
        User setolduser = User(
          id: olduser.id,
          litecoinAmt: (int.parse(olduser.litecoinAmt) - int.parse(litecoinVal))
              .toString(),
        );
        DatabaseService.updateLitecoinCoin(setolduser);
        User newuser = await DatabaseService.getUserWithId(recieverAddress);
        User setnewuser = User(
          id: newuser.id,
          litecoinAmt: (int.parse(newuser.litecoinAmt) + int.parse(litecoinVal))
              .toString(),
        );
        DatabaseService.updateLitecoinCoin(setnewuser);
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Request Submitted")));
        TextEditingController().clear();
      } else {
        FocusScope.of(context).unfocus();
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Request")));
      }
    }
  }

  _setBitbot() async {
    if (_bitbotformKey.currentState.validate() && !_isLoading) {
      _bitbotformKey.currentState.save();
      print(recieverAddress);
      print(bitbotVal);
      print('object');
      if (mounted) {
        setState(() {
          _isLoading = true;
        });
      }
      User olduser = await DatabaseService.getUserWithId(widget.currentUserId);
      if (int.parse(olduser.bitbotAmt) > int.parse(bitbotVal)) {
        User setolduser = User(
          id: olduser.id,
          bitbotAmt:
              (int.parse(olduser.bitbotAmt) - int.parse(bitbotVal)).toString(),
        );
        DatabaseService.updateBitbotCoin(setolduser);
        User newuser = await DatabaseService.getUserWithId(recieverAddress);
        User setnewuser = User(
          id: newuser.id,
          bitbotAmt:
              (int.parse(newuser.bitbotAmt) + int.parse(bitbotVal)).toString(),
        );
        DatabaseService.updateBitbotCoin(setnewuser);
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Request Submitted")));
        TextEditingController().clear();
      } else {
        FocusScope.of(context).unfocus();
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Request")));
      }
    }
  }

  _setRipple() async {
    if (_rippleformKey.currentState.validate() && !_isLoading) {
      _rippleformKey.currentState.save();
      print(recieverAddress);
      print(rippleVal);
      print('object');
      if (mounted) {
        setState(() {
          _isLoading = true;
        });
      }
      User olduser = await DatabaseService.getUserWithId(widget.currentUserId);
      if (int.parse(olduser.rippleAmt) > int.parse(rippleVal)) {
        User setolduser = User(
          id: olduser.id,
          rippleAmt:
              (int.parse(olduser.rippleAmt) - int.parse(rippleVal)).toString(),
        );
        DatabaseService.updateRippleCoin(setolduser);
        User newuser = await DatabaseService.getUserWithId(recieverAddress);
        User setnewuser = User(
          id: newuser.id,
          rippleAmt:
              (int.parse(newuser.rippleAmt) + int.parse(rippleVal)).toString(),
        );
        DatabaseService.updateRippleCoin(setnewuser);
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Request Submitted")));
        TextEditingController().clear();
      } else {
        FocusScope.of(context).unfocus();
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Request")));
      }
    }
  }

  _setCardano() async {
    if (_cardanoformKey.currentState.validate() && !_isLoading) {
      _cardanoformKey.currentState.save();
      print(recieverAddress);
      print(cardanoVal);
      print('object');
      if (mounted) {
        setState(() {
          _isLoading = true;
        });
      }
      User olduser = await DatabaseService.getUserWithId(widget.currentUserId);
      if (int.parse(olduser.cardanoAmt) > int.parse(cardanoVal)) {
        User setolduser = User(
          id: olduser.id,
          cardanoAmt: (int.parse(olduser.cardanoAmt) - int.parse(cardanoVal))
              .toString(),
        );
        DatabaseService.updateCardanoCoin(setolduser);
        User newuser = await DatabaseService.getUserWithId(recieverAddress);
        User setnewuser = User(
          id: newuser.id,
          cardanoAmt: (int.parse(newuser.cardanoAmt) + int.parse(cardanoVal))
              .toString(),
        );
        DatabaseService.updateCardanoCoin(setnewuser);
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Request Submitted")));
        TextEditingController().clear();
      } else {
        FocusScope.of(context).unfocus();
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Request")));
      }
    }
  }

  _setStellar() async {
    if (_stellarformKey.currentState.validate() && !_isLoading) {
      _stellarformKey.currentState.save();
      print(recieverAddress);
      print(stellarVal);
      print('object');
      if (mounted) {
        setState(() {
          _isLoading = true;
        });
      }
      User olduser = await DatabaseService.getUserWithId(widget.currentUserId);
      if (int.parse(olduser.stellarAmt) > int.parse(stellarVal)) {
        User setolduser = User(
          id: olduser.id,
          stellarAmt: (int.parse(olduser.stellarAmt) - int.parse(stellarVal))
              .toString(),
        );
        DatabaseService.updateStellarCoin(setolduser);
        User newuser = await DatabaseService.getUserWithId(recieverAddress);
        User setnewuser = User(
          id: newuser.id,
          stellarAmt: (int.parse(newuser.stellarAmt) + int.parse(stellarVal))
              .toString(),
        );
        DatabaseService.updateStellarCoin(setnewuser);
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Request Submitted")));
        TextEditingController().clear();
      } else {
        FocusScope.of(context).unfocus();
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Request")));
      }
    }
  }

  _setZain(BuildContext context) async {
    if (_zainformKey.currentState.validate() && !_isLoading) {
      _zainformKey.currentState.save();
      print(recieverAddress);
      print(zainVal);
      print('object');
      if (mounted) {
        setState(() {
          _isLoading = true;
        });
      }
      User olduser = await DatabaseService.getUserWithId(widget.currentUserId);
      if (num.parse(olduser.zainAmt) > num.parse(zainVal)) {
        User setolduser = User(
          id: olduser.id,
          zainAmt: (num.parse(olduser.zainAmt) - num.parse(zainVal))
              .toStringAsFixed(4),
        );
        DatabaseService.updateZainCoin(setolduser);
        User newuser = await DatabaseService.getUserWithId(recieverAddress);
        User setnewuser = User(
          id: newuser.id,
          zainAmt: (num.parse(newuser.zainAmt) + num.parse(zainVal))
              .toStringAsFixed(4),
        );
        DatabaseService.updateZainCoin(setnewuser);
        Scaffold.of(context).showSnackBar(SnackBar(content: Text("USD Sent")));
        TextEditingController().clear();
      } else {
        FocusScope.of(context).unfocus();
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Request")));
      }
    }
  }

  _setMonero() async {
    if (_moneroformKey.currentState.validate() && !_isLoading) {
      _moneroformKey.currentState.save();
      print(recieverAddress);
      print(moneroVal);
      print('object');
      if (mounted) {
        setState(() {
          _isLoading = true;
        });
      }
      User olduser = await DatabaseService.getUserWithId(widget.currentUserId);
      if (int.parse(olduser.moneroAmt) > int.parse(moneroVal)) {
        User setolduser = User(
          id: olduser.id,
          moneroAmt:
              (int.parse(olduser.moneroAmt) - int.parse(moneroVal)).toString(),
        );
        DatabaseService.updateMoneroCoin(setolduser);
        User newuser = await DatabaseService.getUserWithId(recieverAddress);
        User setnewuser = User(
          id: newuser.id,
          moneroAmt:
              (int.parse(newuser.moneroAmt) + int.parse(moneroVal)).toString(),
        );
        DatabaseService.updateMoneroCoin(setnewuser);
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Request Submitted")));
        TextEditingController().clear();
      } else {
        FocusScope.of(context).unfocus();
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Request")));
      }
    }
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
                  if (!snapshot.hasData) {
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                FutureBuilder(
                                    future: zainRef.document('zain').get(),
                                    builder: (context, snapshot) {
                                      //Bynase bynase = Bynase.fromDoc(snapshot.data);
                                      // byn = bynase.currentPrice;
                                      return Form(
                                        key: _zainformKey,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: <Widget>[
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    10,
                                                child: TextFormField(
                                                    controller:
                                                        TextEditingController(),
                                                    keyboardType:
                                                        TextInputType.text,
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(
                                                          30),
                                                    ],
                                                    style: new TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.black),
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          'Reciever Address',
                                                      hintStyle: TextStyle(
                                                          color:
                                                              Colors.grey[400],
                                                          fontSize: 13),
                                                      contentPadding:
                                                          new EdgeInsets.only(
                                                              left: 4,
                                                              right: 4),
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0)),
                                                    ),
                                                    validator: validations
                                                        .validateAddress,
                                                    onSaved: (input) {
                                                      if (input.isNotEmpty) {
                                                        recieverAddress = input;
                                                      }
                                                    }),
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
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    10,
                                                child: TextFormField(
                                                  controller:
                                                      TextEditingController(),
                                                  keyboardType: TextInputType
                                                      .numberWithOptions(
                                                          decimal: true),
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        12),
                                                    DecimalTextInputFormatter(
                                                        decimalRange: 4),
                                                  ],
                                                  style: new TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
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
                                                            BorderRadius
                                                                .circular(6.0)),
                                                  ),
                                                  validator: (input) =>
                                                      input.trim().length < 1 &&
                                                              input.contains(
                                                                  new RegExp(
                                                                      r'[A-Z]'))
                                                          ? 'Enter Amount'
                                                          : null,
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
                                                  try {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    _setZain(context);
                                                    _isLoading = false;
                                                  } catch (e) {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    Scaffold.of(context)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                "Invalid Request")));
                                                  }
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      20,
                                                  decoration: BoxDecoration(
                                                      color: Colors.green[300],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3)),
                                                  child: Center(
                                                      child: Text(
                                                    'SEND USD',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 20),
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
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
