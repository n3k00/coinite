import 'package:coinite/network/api_constant.dart';
import 'package:coinite/network/response/get_crypto_response.dart';
import 'package:coinite/network/response/get_fear_index_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'crypto_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class CryptoAPI {
  factory CryptoAPI(Dio dio, {String baseUrl}) = _CryptoAPI;

  @GET(END_POINT_GET_CRYPTO_LIST)
  Future<GetCryptoResponse> getCryptoList(
    @Query(LIMIT) String limit,
  );
  @GET(END_POINT_GET_FEAR_INDEX)
  Future<GetFearIndexResponse> getFearIndexList(
    @Query(LIMIT) String limit,
  );
}
