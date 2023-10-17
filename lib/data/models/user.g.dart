// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      firebaseUserId: json['firebaseUserId'] as String?,
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firebaseUserId': instance.firebaseUserId,
      'displayName': instance.displayName,
      'email': instance.email,
    };
