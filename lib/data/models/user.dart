import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final String? id;
  final String? firebaseUserId;
  final String? displayName;
  final String? email;

  const User({
    required this.id,
    required this.firebaseUserId,
    required this.displayName,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [
        id,
        firebaseUserId,
        displayName,
        email,
      ];
}
