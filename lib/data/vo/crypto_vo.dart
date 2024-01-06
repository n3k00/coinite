import 'package:coinite/data/vo/quotes_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_vo.g.dart';

@JsonSerializable()
class CryptoVO {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "symbol")
  String symbol;

  @JsonKey(name: "website_slug")
  String websiteSlug;

  @JsonKey(name: "rank")
  int rank;

  @JsonKey(name: "circulating_supply")
  int circulatingSupply;

  @JsonKey(name: "total_supply")
  int totalSupply;

  @JsonKey(name: "max_supply")
  int maxSupply;

  @JsonKey(name: "quotes")
  Quotes quotes;

  CryptoVO(
    this.id,
    this.name,
    this.symbol,
    this.websiteSlug,
    this.rank,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.quotes,
  );

  factory CryptoVO.fromJson(Map<String, dynamic> json) =>
      _$CryptoVOFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoVOToJson(this);
}
