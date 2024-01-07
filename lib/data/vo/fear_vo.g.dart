// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fear_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FearVO _$FearVOFromJson(Map<String, dynamic> json) => FearVO(
      json['value'] as String,
      json['value_classification'] as String,
      json['timestamp'] as String,
      json['time_until_update'] as String?,
    );

Map<String, dynamic> _$FearVOToJson(FearVO instance) => <String, dynamic>{
      'value': instance.value,
      'value_classification': instance.valueClassification,
      'timestamp': instance.timestamp,
      'time_until_update': instance.timeUntilUpdate,
    };
