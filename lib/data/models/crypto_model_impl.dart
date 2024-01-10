import 'package:coinite/data/models/crypto_model.dart';
import 'package:coinite/data/vo/crypto_vo.dart';
import 'package:coinite/data/vo/fear_vo.dart';
import 'package:coinite/network/data_agents/crypto_data_agent.dart';
import 'package:coinite/network/data_agents/retrofit_data_agent_impl.dart';

class CryptoModelImpl extends CryptoModel {
  CryptoDataAgent cDataAgent = RetrofitDataAgentImpl();

  static final CryptoModelImpl _singleton = CryptoModelImpl._internal();

  factory CryptoModelImpl() {
    return _singleton;
  }

  CryptoModelImpl._internal();
  @override
  Future<List<CryptoVO>> getCryptoList(int limit) {
    return cDataAgent.getCryptoList(limit).asStream().map((list) {
      list.sort((a, b) =>
          b.quotes.detailVO.marketCap.compareTo(a.quotes.detailVO.marketCap));
      return list;
    }).first;
  }

  @override
  Future<List<FearVO>> getFearIndexList(int limit) {
    return cDataAgent.getFearIndexList(limit);
  }

  @override
  Future<List<CryptoVO>> getCryptoSearch(String search) {
    return cDataAgent.getCryptoList(100).asStream().map((list) {
      list.sort((a, b) =>
          b.quotes.detailVO.marketCap.compareTo(a.quotes.detailVO.marketCap));
      // Filter the list based on the search parameter
      List<CryptoVO> filteredList = list
          .where((crypto) =>
              crypto.name.toLowerCase().contains(search.toLowerCase()) ||
              crypto.symbol.toLowerCase().contains(search.toLowerCase()))
          .toList();
      return filteredList;
    }).first;
  }
}
