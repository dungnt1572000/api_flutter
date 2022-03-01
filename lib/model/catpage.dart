import 'dart:io';

import 'package:bloc_training/model/link.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';
import 'datum.dart';
part 'catpage.g.dart';
@JsonSerializable()
class CatPage {
  int currentPage;
  List<Datum> datum;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  String nextPageUrl;
  String path;
  int perPage;
  String? prevPageUrl;
  int to;
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
