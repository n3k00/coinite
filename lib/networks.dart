import 'dart:convert';

import 'package:coinite/data/vo/crypto_vo.dart';
import 'package:coinite/network/response/get_crypto_response.dart';
import 'package:http/http.dart' as http;

class Network {
  void getCrypto() async {
    Uri url = Uri.parse("https://api.alternative.me/v2/ticker/?limit=10");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      GetCryptoResponse getCryptoResponse =
          GetCryptoResponse.fromJson(jsonDecode(response.body));
      Iterable<CryptoVO> cryptoList = getCryptoResponse.data.values;
      print(cryptoList.runtimeType);
      // Now, cryptoList contains a list of CryptoVO objects.
      for (CryptoVO cryptoData in cryptoList) {
        print('${cryptoData.name} (${cryptoData.symbol}):');
      }
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  }
}
