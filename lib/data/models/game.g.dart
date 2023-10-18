// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      id: json['id'] as int,
      code: json['code'] as String?,
      locationDescription: json['locationDescription'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      description: json['description'] as String?,
      maxPlayers: json['maxPlayers'] as int,
      joinedPlayers: json['joinedPlayers'] as int,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'locationDescription': instance.locationDescription,
      'startTime': instance.startTime.toIso8601String(),
      'description': instance.description,
      'maxPlayers': instance.maxPlayers,
      'joinedPlayers': instance.joinedPlayers,
      'price': instance.price,
      'image': instance.image,
    };
