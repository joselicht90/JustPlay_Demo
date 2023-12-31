import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'state.g.dart';

@JsonSerializable()
class CountryState extends Equatable {
  final int id;
  final String name;
  final String iso2;

  const CountryState({
    required this.id,
    required this.name,
    required this.iso2,
  });

  factory CountryState.fromJson(Map<String, dynamic> json) =>
      _$CountryStateFromJson(json);
  Map<String, dynamic> toJson() => _$CountryStateToJson(this);

  @override
  List<Object?> get props => [id, name, iso2];
}
