import 'Network.dart';
import 'package:flutter/material.dart';
const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  var btcBody;
  var ethBody;
  var xtzBody;
  Future getData(currency) async {
     btcBody = await Network(cryptoName: 'BTC',currency: currency).getData();
     ethBody = await Network(cryptoName: 'ETH',currency: currency).getData();
     xtzBody = await Network(cryptoName: 'XTZ',currency: currency).getData();
  }
}
