import 'package:json_annotation/json_annotation.dart';

part 'fear_vo.g.dart';

@JsonSerializable()
class FearVO {
  @JsonKey(name: "value")
  String value;

  @JsonKey(name: "value_classification")
  String valueClassification;

  @JsonKey(name: "timestamp")
  String timestamp;

  @JsonKey(name: "time_until_update")
  String? timeUntilUpdate;

  FearVO(this.value, this.valueClassification, this.timestamp,
      this.timeUntilUpdate);

  factory FearVO.fromJson(Map<String, dynamic> json) => _$FearVOFromJson(json);

  Map<String, dynamic> toJson() => _$FearVOToJson(this);
}
