// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_crypto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCryptoResponse _$GetCryptoResponseFromJson(Map<String, dynamic> json) =>
    GetCryptoResponse(
      data: (json['data'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, CryptoVO.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$GetCryptoResponseToJson(GetCryptoResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
