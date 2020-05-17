import 'dart:convert';

import 'package:bitcoin_ticker/Network.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/newScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  
  void getData() async {
    CoinData data = CoinData();
    await data.getData('USD');
    if(data.btcBody!=null){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
            return NewScreen(btcBody: data.btcBody,ethBody: data.ethBody,xtzBody: data.xtzBody,);
        }));
    }else print('objec');
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
    );
  }
}




