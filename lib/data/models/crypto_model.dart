import 'package:coinite/data/vo/crypto_vo.dart';
import 'package:coinite/data/vo/fear_vo.dart';

abstract class CryptoModel {
  Future<List<CryptoVO>> getCryptoList(int limit);
  Future<List<FearVO>> getFearIndexList(int limit);
}
