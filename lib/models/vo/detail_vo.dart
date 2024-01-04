import 'package:json_annotation/json_annotation.dart';

part 'detail_vo.g.dart';

@JsonSerializable()
class DetailVO {
  @JsonKey(name: "price")
  double price;

  @JsonKey(name: "volume_24h")
  int volume24H;

  @JsonKey(name: "market_cap")
  int marketCap;

  @JsonKey(name: "percent_change_1h")
  double percentChange1h;

  @JsonKey(name: "percent_change_24h")
  double percentChange24h;

  @JsonKey(name: "percent_change_7d")
  double percentChange7d;

  DetailVO(
    this.price,
    this.volume24H,
    this.marketCap,
    this.percentChange1h,
    this.percentChange24h,
    this.percentChange7d,
  );
  factory DetailVO.fromJson(Map<String, dynamic> json) =>
      _$DetailVOFromJson(json);

  Map<String, dynamic> toJson() => _$DetailVOToJson(this);
}
