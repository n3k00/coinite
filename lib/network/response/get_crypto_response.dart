import 'package:coinite/data/vo/crypto_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_crypto_response.g.dart';

@JsonSerializable()
class GetCryptoResponse {
  @JsonKey(name: "data")
  Map<String, CryptoVO> data;

  GetCryptoResponse({
    required this.data,
  });

  factory GetCryptoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCryptoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCryptoResponseToJson(this);
}
