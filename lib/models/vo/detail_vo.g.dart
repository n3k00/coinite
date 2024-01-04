// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailVO _$DetailVOFromJson(Map<String, dynamic> json) => DetailVO(
      (json['price'] as num).toDouble(),
      json['volume_24h'] as int,
      json['market_cap'] as int,
      (json['percent_change_1h'] as num).toDouble(),
      (json['percent_change_24h'] as num).toDouble(),
      (json['percent_change_7d'] as num).toDouble(),
    );

Map<String, dynamic> _$DetailVOToJson(DetailVO instance) => <String, dynamic>{
      'price': instance.price,
      'volume_24h': instance.volume24H,
      'market_cap': instance.marketCap,
      'percent_change_1h': instance.percentChange1h,
      'percent_change_24h': instance.percentChange24h,
      'percent_change_7d': instance.percentChange7d,
    };
