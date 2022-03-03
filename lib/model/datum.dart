import 'package:json_annotation/json_annotation.dart';
part 'datum.g.dart';
@JsonSerializable()
class Datum{
  @JsonKey(name: 'breed')
  String breed;
  @JsonKey(name: 'country')
  String country;
  @JsonKey(name: 'origin')
  String origin;
  @JsonKey(name: 'coat')
  String coat;
  @JsonKey(name: 'pattern')
  String pattern;

  Datum(this.breed, this.country, this.origin, this.coat, this.pattern);

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}