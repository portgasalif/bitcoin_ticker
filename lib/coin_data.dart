import 'dart:convert';
import 'package:http/http.dart' as http;

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
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'EB707B99-C235-4B58-A4CA-6C6831A02E7C';

class CoinData {
  Future<double> getCoinData(String currency) async {
    String Url = '$coinAPIURL/BTC/$currency?apikey=$apiKey';
    http.Response response = await http.get(Uri.parse(Url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var lastPrice = data['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem';
    }
  }
}
