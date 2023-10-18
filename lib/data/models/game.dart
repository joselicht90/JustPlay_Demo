import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game.g.dart';

// This is a model of game. I use Serializable to create json methods automatically
@JsonSerializable()
class Game extends Equatable {
  final int id;
  final String? code;
  final String locationDescription;
  final DateTime startTime;
  final String? description;
  final int maxPlayers;
  final int joinedPlayers;
  final double price;
  final String? image;

  const Game({
    required this.id,
    this.code,
    required this.locationDescription,
    required this.startTime,
    this.description,
    required this.maxPlayers,
    required this.joinedPlayers,
    required this.price,
    this.image,
  });

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
  Map<String, dynamic> toJson() => _$GameToJson(this);

  @override
  List<Object?> get props => [
        id,
        code,
        locationDescription,
        startTime,
        description,
        maxPlayers,
        joinedPlayers,
        price,
        image,
      ];
}
