import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cryptoCard.dart';
import 'coin_data.dart';
import 'dart:io'show Platform;
class NewScreen extends StatefulWidget {
  final btcBody;
  final ethBody;
  final xtzBody;
  NewScreen({this.btcBody,this.ethBody,this.xtzBody});
  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {

  @override
  void initState() {
    super.initState();
    setRate(widget.btcBody,widget.ethBody,widget.xtzBody);
  }
  String btcRate,ethRate,xtzRate;
  String fiat ='USD';
  void setRate(btcBody,ethBody,xtzBody){
    setState(() {
      btcRate = btcBody['rate'].toStringAsFixed(2);
      ethRate = ethBody['rate'].toStringAsFixed(2);
      xtzRate = xtzBody['rate'].toStringAsFixed(2);
    });
  }

  @override
  DropdownButton<String> androidWidget(){
    List<DropdownMenuItem<String>> myList = [];
    for(String abc in currenciesList){
      var listItem =  DropdownMenuItem<String>(child: Text(abc), value: abc,);
      myList.add(listItem);
    }
    return DropdownButton<String>(
      value: fiat,
      onChanged: (String newValue) {
        setState(() async{
          fiat = newValue;
          CoinData data = CoinData();
          await data.getData(fiat);
          setRate(data.btcBody, data.ethBody, data.xtzBody);
        });
      },
      items: myList,
    );
  }

  CupertinoPicker iOSWidget(){
    List<Widget> list = [];
    for(String abc in currenciesList){
      list.add(Text(abc));
    }
    return CupertinoPicker(itemExtent: 30,
      onSelectedItemChanged: (int value) async{
        fiat = currenciesList.elementAt(value);
        CoinData data = CoinData();
        await data.getData(fiat);
        setRate(data.btcBody, data.ethBody, data.xtzBody);
      },
      children: list,
      magnification: 1.5,
      squeeze: 1,
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Crypto Currency',)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CryptoCard('BTC',fiat,btcRate),
              CryptoCard('ETH',fiat,ethRate),
              CryptoCard('XTZ',fiat,xtzRate),
            ],
          ),
          Container(

              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(top:10.0,bottom: 10.0),
              color: Colors.grey,
              child: Platform.isIOS ? iOSWidget() : androidWidget()
          ),
        ],
      ),

    );;
  }
}
