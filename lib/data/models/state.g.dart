// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryState _$CountryStateFromJson(Map<String, dynamic> json) => CountryState(
      id: json['id'] as int,
      name: json['name'] as String,
      iso2: json['iso2'] as String,
    );

Map<String, dynamic> _$CountryStateToJson(CountryState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iso2': instance.iso2,
    };
