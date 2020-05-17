import 'dart:convert';

import 'package:http/http.dart' as http;
String coinApi = '43F59944-34DA-46E0-9D7C-3F1EAE80A7DD';

class Network{
  String cryptoName;
  String currency;
  Network({this.cryptoName,this.currency});
  Future<dynamic> getData() async{
    http.Response response = await http.
    get('https://rest.coinapi.io/v1/exchangerate/$cryptoName/$currency?apikey=$coinApi');
    var body =  jsonDecode(response.body);
    return body;
  }
}
