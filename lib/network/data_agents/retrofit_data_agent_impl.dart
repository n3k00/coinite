import 'package:coinite/data/vo/crypto_vo.dart';
import 'package:coinite/data/vo/fear_vo.dart';
import 'package:coinite/network/crypto_api.dart';
import 'package:coinite/network/data_agents/crypto_data_agent.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RetrofitDataAgentImpl extends CryptoDataAgent {
  late CryptoAPI cApi;
  var box = GetStorage("coinite");

  static final RetrofitDataAgentImpl _singleton =
      RetrofitDataAgentImpl._internal();

  factory RetrofitDataAgentImpl() {
    return _singleton;
  }

  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    cApi = CryptoAPI(dio);
  }

  @override
  Future<List<CryptoVO>> getCryptoList(int limit) async {
    return cApi.getCryptoList(limit.toString()).asStream().map(
      (response) {
        // Assuming the response is a List<dynamic>
        Iterable<CryptoVO> cryptoList = response.data.values;

        return cryptoList.toList();
      },
    ).first;
  }

  @override
  Future<List<FearVO>> getFearIndexList(int limit) {
    return cApi
        .getFearIndexList(limit.toString())
        .asStream()
        .map((response) => response.data)
        .first;
  }
}
