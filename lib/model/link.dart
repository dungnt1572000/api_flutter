import 'package:json_annotation/json_annotation.dart';
part 'link.g.dart';
@JsonSerializable()
class Link{
  @JsonKey(name: 'url')
  String? url;
  @JsonKey(name: 'label')
  String label;
  @JsonKey(name: 'active')
  bool active;

  Link(this.url, this.label, this.active);

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);


  Map<String, dynamic> toJson() => _$LinkToJson(this);
}