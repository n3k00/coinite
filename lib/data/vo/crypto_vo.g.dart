// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoVO _$CryptoVOFromJson(Map<String, dynamic> json) => CryptoVO(
      json['id'] as int,
      json['name'] as String,
      json['symbol'] as String,
      json['website_slug'] as String,
      json['rank'] as int,
      json['circulating_supply'] as int,
      json['total_supply'] as int,
      json['max_supply'] as int,
      Quotes.fromJson(json['quotes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CryptoVOToJson(CryptoVO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'website_slug': instance.websiteSlug,
      'rank': instance.rank,
      'circulating_supply': instance.circulatingSupply,
      'total_supply': instance.totalSupply,
      'max_supply': instance.maxSupply,
      'quotes': instance.quotes,
    };
