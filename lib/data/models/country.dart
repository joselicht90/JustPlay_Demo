import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country extends Equatable {
  final int id;
  final String name;
  final String iso2;

  const Country({
    required this.id,
    required this.name,
    required this.iso2,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryToJson(this);

  @override
  List<Object?> get props => [id, name, iso2];
}
