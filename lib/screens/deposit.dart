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
class Deposit extends StatefulWidget {
  final String currentUserId;
  final String userId;

  const Deposit({this.currentUserId, this.userId});
  @override
  _DepositState createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  bool _isLoading = false;
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
      child: Text("Deposit is not available at the moment"),
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
        title: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: 30),
          child: Text(
            'DEPOSIT',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontFamily: 'Billabong'),
          ),
        ),
      ),
      backgroundColor: Color(0xFF011143),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.height / 2.8,
              child: Image(
                image: AssetImage("images/atmcard.jpg"),
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    Container(
                      height: (MediaQuery.of(context).size.height / 2.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'XXBASE Address :',
                            style: TextStyle(
                              fontFamily: 'Bellany',
                              color: Colors.black87,
                              fontSize: 15.0,
                            ),
                          ),
                          Text(
                            '1JYALHSJMGZJL19DfyCKq2EoMZBiqjrdW7',
                            style: TextStyle(
                                fontFamily: 'Bellany',
                                color: Colors.green,
                                fontSize: 18.8,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 30,
                          ),
                          Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 1.8,
                              height: MediaQuery.of(context).size.height / 10,
                              child: TextFormField(
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(12),
                                ],
                                style: new TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  contentPadding:
                                      new EdgeInsets.only(left: 4, right: 4),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                                validator: (input) => input.trim().length < 1 &&
                                        input.contains(new RegExp(r'[A-Z]'))
                                    ? 'Enter Price'
                                    : null,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 50,
                          ),
                          Center(
                            child: RaisedButton(
                              elevation: 0,
                              padding: EdgeInsets.all(0),
                              onPressed: () {
                                _showToast();
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.green[800],
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                height: MediaQuery.of(context).size.height / 15,
                                child: Center(
                                  child: Text(
                                    'Deposit',
                                    style: TextStyle(
                                      fontFamily: 'Bellany',
                                      color: Colors.white70,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
