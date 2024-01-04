import 'dart:convert';

import 'package:coinite/models/vo/crypto_vo.dart';
import 'package:http/http.dart' as http;

class Network {
  void getCrypto() async {
    Uri url = Uri.parse("https://api.alternative.me/v2/ticker/?limit=10");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      Map<String, dynamic> cryptoDataMap = data['data'];

      List<CryptoVO> cryptoDataList = cryptoDataMap.entries
          .map((entry) => CryptoVO.fromJson(entry.value))
          .toList();

      // Now, cryptoDataList contains a list of CryptoVO objects.
      for (CryptoVO cryptoData in cryptoDataList) {
        print('${cryptoData.name} (${cryptoData.symbol}):');
      }
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  }
}
