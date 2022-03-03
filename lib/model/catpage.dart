import 'dart:io';

import 'package:bloc_training/model/link.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';
import 'datum.dart';
part 'catpage.g.dart';
@JsonSerializable()
class CatPage {
  @JsonKey(name: 'current_page')
  int currentPage;
  @JsonKey(name: 'data')
  List<Datum> datum;
  @JsonKey(name: 'first_page_url')
  String firstPageUrl;
  @JsonKey(name: 'from')
  int from;
  @JsonKey(name: 'last_page')
  int lastPage;
  @JsonKey(name: 'last_page_url')
  String lastPageUrl;
  @JsonKey(name: 'links')
  List<Link> links;
  @JsonKey(name: 'next_page_url')
  String nextPageUrl;
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'per_page')
  int perPage;
  @JsonKey(name: 'prev_page_url')
  String? prevPageUrl;
  @JsonKey(name: 'to')
  int to;
  @JsonKey(name: 'total')
  int total;


  CatPage(this.currentPage,
      this.datum,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total);

  factory CatPage.fromJson(Map<String, dynamic> json) => _$CatPageFromJson(json);
  Map<String, dynamic> toJson() => _$CatPageToJson(this);
}
