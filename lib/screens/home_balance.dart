import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_cash_user/model/bitbot_model.dart';
import 'package:crypto_cash_user/model/bitcoin_model.dart';
import 'package:crypto_cash_user/model/bynase_model.dart';
import 'package:crypto_cash_user/model/cardano_model.dart';
import 'package:crypto_cash_user/model/ethereum_model.dart';
import 'package:crypto_cash_user/model/litecoin_model.dart';
import 'package:crypto_cash_user/model/monero_model.dart';
import 'package:crypto_cash_user/model/ripple_model.dart';
import 'package:crypto_cash_user/model/stellar_model.dart';
import 'package:crypto_cash_user/model/user_model.dart';
import 'package:crypto_cash_user/model/zain_model.dart';
import 'package:crypto_cash_user/screens/deposit.dart';
import 'package:crypto_cash_user/screens/edit_profile_screen.dart';
import 'package:crypto_cash_user/screens/history.dart';
import 'package:crypto_cash_user/screens/news_feed.dart';
import 'package:crypto_cash_user/screens/profile.dart';
import 'package:crypto_cash_user/screens/request.dart';
import 'package:crypto_cash_user/services/authentication.dart';
import 'package:crypto_cash_user/services/database_service.dart';
import 'package:crypto_cash_user/utilities/constants.dart';
import 'package:crypto_cash_user/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeBalance extends StatefulWidget {
  final String currentUserId;
  final String userId;

  const HomeBalance({this.currentUserId, this.userId});

  @override
  _HomeBalanceState createState() => _HomeBalanceState();
}

class _HomeBalanceState extends State<HomeBalance> {
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
      child: Text("Please deposit \$100 in your USD account to start trading"),
    );

    flutterToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
    );
  }

  _submit() {
    UserAuth.logout(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      drawer: FutureBuilder(
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
          return Container(
            color: Color(0xFF011143),
            child: Drawer(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  //header
                  UserAccountsDrawerHeader(
                    accountName: Text(user.name),
                    accountEmail: Text(user.email),
                    currentAccountPicture: GestureDetector(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: user.profileImageUrl.isEmpty
                            ? AssetImage('')
                            : CachedNetworkImageProvider(user.profileImageUrl),
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF011143),
                    ),
                  ),
                  //drawer body
                  InkWell(
                    onTap: () {
                      _showToast();
                    },
                    child: ListTile(
                      title: Center(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Center(
                              child: Image(
                                image: AssetImage("images/exchange.png"),
                                height: 30,
                                width: 30,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Exchange',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Divider(color: Colors.grey[400]),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Deposit(),
                      ),
                    ),
                    child: ListTile(
                      title: Center(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Image(
                              image: AssetImage("images/deposit.png"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Deposit',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Divider(color: Colors.grey[400]),

                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => History(
                            currentUserId: widget.currentUserId,
                            userId: widget.currentUserId),
                      ),
                    ),
                    child: ListTile(
                      title: Center(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.view_list,
                              color: Colors.green,
                              size: 35,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Transaction History',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Divider(color: Colors.grey[400]),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SendRecieve(
                            currentUserId: widget.currentUserId,
                            userId: widget.currentUserId),
                      ),
                    ),
                    child: ListTile(
                      title: Center(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Image(
                              image: AssetImage("images/sendrecieve.png"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Request',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Divider(color: Colors.grey[400]),

                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    ),
                    child: ListTile(
                      title: Center(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Image(
                              image: AssetImage("images/news.png"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'News Feed',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey[400]),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfileScreen(
                                  user: user,
                                ))),
                    child: ListTile(
                      title: Center(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Image(
                              image: AssetImage("images/settings.png"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Profile Settings',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Divider(color: Colors.grey[400]),

                  InkWell(
                    onTap: _submit,
                    child: ListTile(
                      title: Center(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Center(
                              child: Image(
                                image: AssetImage("images/logout.png"),
                                height: 30,
                                width: 30,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
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
      appBar: new AppBar(
        backgroundColor: Color(0xFF011143),
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Text(
              'XXBASE',
              style: TextStyle(
                  color: Colors.white, fontSize: 22, fontFamily: 'Billabong'),
            ),
          ),
        ),
        /*  actions: <Widget>[
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
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfileScreen(
                                user: user,
                              ))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 10.0, top: 10, bottom: 10),
                    child: SizedBox(
                      height: 20,
                      width: 35,
                      child: CircleAvatar(
                        radius: 5,
                        backgroundImage: user.profileImageUrl.isEmpty
                            ? AssetImage('')
                            : CachedNetworkImageProvider(user.profileImageUrl),
                        backgroundColor: Colors.grey,
                      ),
                    ),
                  ),
                );
              }),
        ],*/
      ),
      backgroundColor: Color(0xFF011143),
      body: FutureBuilder(
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
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          User user = User.fromDoc(snapshot.data);
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
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
                              future: ethereumRef.document('ethereum').get(),
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
                                    future:
                                        litecoinRef.document('litecoin').get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.data == null) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      Litecoin litecoin =
                                          Litecoin.fromDoc(snapshot.data);
                                      num ltcCount =
                                          num.parse(user.litecoinAmt) *
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
                                            BitBot bitBot =
                                                BitBot.fromDoc(snapshot.data);
                                            num bitCount = num.parse(
                                                    user.bitbotAmt) *
                                                num.parse(bitBot.currentPrice);

                                            return FutureBuilder(
                                                future: rippleRef
                                                    .document('ripple')
                                                    .get(),
                                                builder: (context, snapshot) {
                                                  if (snapshot.data == null) {
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
                                                      num.parse(
                                                          ripple.currentPrice);
                                                  return FutureBuilder(
                                                      future: cardanoRef
                                                          .document('cardano')
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
                                                        Cardano cardano =
                                                            Cardano.fromDoc(
                                                                snapshot.data);
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
                                                              Stellar stellar =
                                                                  Stellar.fromDoc(
                                                                      snapshot
                                                                          .data);
                                                              num stellarCount = num
                                                                      .parse(user
                                                                          .stellarAmt) *
                                                                  num.parse(stellar
                                                                      .currentPrice);
                                                              return FutureBuilder(
                                                                  future: zainRef
                                                                      .document(
                                                                          'zain')
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
                                                                    Zain zain =
                                                                        Zain.fromDoc(
                                                                            snapshot.data);
                                                                    num zainCount = num.parse(user
                                                                            .zainAmt) *
                                                                        num.parse(
                                                                            zain.currentPrice);
                                                                    return FutureBuilder(
                                                                        future: moneroRef
                                                                            .document(
                                                                                'monero')
                                                                            .get(),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          if (snapshot.data ==
                                                                              null) {
                                                                            return Center(
                                                                              child: CircularProgressIndicator(),
                                                                            );
                                                                          }
                                                                          Monero
                                                                              monero =
                                                                              Monero.fromDoc(snapshot.data);
                                                                          num moneroCount =
                                                                              num.parse(user.moneroAmt) * num.parse(monero.currentPrice);
                                                                          num total = (btcCount +
                                                                              bynCount +
                                                                              ethCount +
                                                                              ltcCount +
                                                                              bitCount +
                                                                              ripCount +
                                                                              cardCount +
                                                                              stellarCount +
                                                                              zainCount +
                                                                              moneroCount);
                                                                          return Container(
                                                                            height:
                                                                                (MediaQuery.of(context).size.height / 5),
                                                                            child:
                                                                                Column(
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
                height: MediaQuery.of(context).size.height / 1.6,
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
                            'Available coins',
                            style: TextStyle(
                              fontFamily: 'Bellany',
                              color: Colors.black87,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 44.5,
                        ),
                        FutureBuilder(
                            future: zainRef.document('zain').get(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return Container(width: 0.0, height: 0.0);
                              }
                              Zain zain = Zain.fromDoc(snapshot.data);
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Color(0xFFE0E0E0),
                                  backgroundImage:
                                      AssetImage("images/zain.jpg"),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                subtitle: Text(
                                    "Last Price: "
                                    "\$${zain.lastPrice}",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 12)),
                                trailing: Text("\$${zain.currentPrice}",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500)),
                              );
                            }),
                        Divider(color: Colors.grey[400]),
                        FutureBuilder(
                            future: bynaseRef.document('bynase').get(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return Container(width: 0.0, height: 0.0);
                              }
                              Bynase bynase = Bynase.fromDoc(snapshot.data);
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Color(0xFFE0E0E0),
                                  backgroundImage:
                                      AssetImage("images/bynase.jpg"),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                subtitle: Text(
                                    "Last Price: "
                                    "\$${bynase.lastPrice}",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 12)),
                                trailing: Text("\$${bynase.currentPrice}",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500)),
                              );
                            }),
                        Divider(color: Colors.grey[400]),
                        FutureBuilder(
                            future: bitcoinRef.document('bitcoin').get(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return Container(width: 0.0, height: 0.0);
                              }
                              Bitcoin bitcoin = Bitcoin.fromDoc(snapshot.data);
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Color(0xFFE0E0E0),
                                  backgroundImage:
                                      AssetImage("images/bitcoin.png"),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                subtitle: Text(
                                    "Last Price: "
                                    "\$${bitcoin.lastPrice}",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 12)),
                                trailing: Text("\$${bitcoin.currentPrice}",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500)),
                              );
                            }),
                        Divider(color: Colors.grey[400]),
                        FutureBuilder(
                            future: ethereumRef.document('ethereum').get(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return Container(width: 0.0, height: 0.0);
                              }
                              Ethereum ethereum =
                                  Ethereum.fromDoc(snapshot.data);
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Color(0xFFE0E0E0),
                                  backgroundImage:
                                      AssetImage("images/ethereum.png"),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                subtitle: Text(
                                    "Last Price: "
                                    "\$${ethereum.lastPrice}",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 12)),
                                trailing: Text("\$${ethereum.currentPrice}",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500)),
                              );
                            }),
                        Divider(color: Colors.grey[400]),
                        FutureBuilder(
                            future: litecoinRef.document('litecoin').get(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return Container(width: 0.0, height: 0.0);
                              }
                              Litecoin litecoin =
                                  Litecoin.fromDoc(snapshot.data);
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Color(0xFFE0E0E0),
                                  backgroundImage:
                                      AssetImage("images/litecoin.png"),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                subtitle: Text(
                                    "Last Price: "
                                    "\$${litecoin.lastPrice}",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 12)),
                                trailing: Text("\$${litecoin.currentPrice}",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500)),
                              );
                            }),
                        Divider(color: Colors.grey[400]),
                        FutureBuilder(
                            future: bitbotRef.document('bitbot').get(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return Container(width: 0.0, height: 0.0);
                              }
                              BitBot bitBot = BitBot.fromDoc(snapshot.data);
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Color(0xFFE0E0E0),
                                  backgroundImage:
                                      AssetImage("images/bitcoincash.png"),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                subtitle: Text(
                                    "Last Price: "
                                    "\$${bitBot.lastPrice}",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 12)),
                                trailing: Text("\$${bitBot.currentPrice}",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500)),
                              );
                            }),
                        Divider(color: Colors.grey[400]),
                        FutureBuilder(
                            future: rippleRef.document('ripple').get(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return Container(width: 0.0, height: 0.0);
                              }
                              Ripple ripple = Ripple.fromDoc(snapshot.data);
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Color(0xFFE0E0E0),
                                  backgroundImage:
                                      AssetImage("images/ripples.png"),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                subtitle: Text(
                                    "Last Price: "
                                    "\$${ripple.lastPrice}",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 12)),
                                trailing: Text("\$${ripple.currentPrice}",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500)),
                              );
                            }),
                        Divider(color: Colors.grey[400]),
                        FutureBuilder(
                            future: cardanoRef.document('cardano').get(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return Container(width: 0.0, height: 0.0);
                              }
                              Cardano cardano = Cardano.fromDoc(snapshot.data);
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Color(0xFFE0E0E0),
                                  backgroundImage:
                                      AssetImage("images/cardano.jpg"),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                subtitle: Text(
                                    "Last Price: "
                                    "\$${cardano.lastPrice}",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 12)),
                                trailing: Text("\$${cardano.currentPrice}",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500)),
                              );
                            }),
                        Divider(color: Colors.grey[400]),
                        FutureBuilder(
                            future: stellarRef.document('stellar').get(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return Container(width: 0.0, height: 0.0);
                              }
                              Stellar stellar = Stellar.fromDoc(snapshot.data);
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Color(0xFFE0E0E0),
                                  backgroundImage:
                                      AssetImage("images/steller.png"),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                subtitle: Text(
                                    "Last Price: "
                                    "\$${stellar.lastPrice}",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 12)),
                                trailing: Text("\$${stellar.currentPrice}",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500)),
                              );
                            }),
                        Divider(color: Colors.grey[400]),
                        FutureBuilder(
                            future: moneroRef.document('monero').get(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return Container(width: 0.0, height: 0.0);
                              }
                              Monero monero = Monero.fromDoc(snapshot.data);
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Color(0xFFE0E0E0),
                                  backgroundImage:
                                      AssetImage("images/monero.png"),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                subtitle: Text(
                                    "Last Price: "
                                    "\$${monero.lastPrice}",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 12)),
                                trailing: Text("\$${monero.currentPrice}",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500)),
                              );
                            }),
                        Divider(color: Colors.grey[400]),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
