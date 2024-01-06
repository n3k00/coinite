// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_fear_index_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFearIndexResponse _$GetFearIndexResponseFromJson(
        Map<String, dynamic> json) =>
    GetFearIndexResponse(
      json['name'] as String,
      (json['data'] as List<dynamic>)
          .map((e) => FearVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetFearIndexResponseToJson(
        GetFearIndexResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'data': instance.data,
    };
