import 'package:json_annotation/json_annotation.dart';
part 'datum.g.dart';
@JsonSerializable()
class Datum{
  String breed;
  String country;
  String origin;
  String coat;
  String pattern;

  Datum(this.breed, this.country, this.origin, this.coat, this.pattern);

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}