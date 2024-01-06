import 'package:coinite/data/vo/fear_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_fear_index_response.g.dart';

@JsonSerializable()
class GetFearIndexResponse {
  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "data")
  List<FearVO> data;

  GetFearIndexResponse(this.name, this.data);

  factory GetFearIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFearIndexResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetFearIndexResponseToJson(this);
}
