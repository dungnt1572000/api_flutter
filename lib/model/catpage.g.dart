// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catpage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatPage _$CatPageFromJson(Map<String, dynamic> json) => CatPage(
      json['current_page'] as int,
      (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['first_page_url'] as String,
      json['from'] as int,
      json['last_page'] as int,
      json['last_page_url'] as String,
      (json['links'] as List<dynamic>)
          .map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['next_page_url'] as String,
      json['path'] as String,
      json['per_page'] as int,
      json['prev_page_url'] as String?,
      json['to'] as int,
      json['total'] as int,
    );

Map<String, dynamic> _$CatPageToJson(CatPage instance) => <String, dynamic>{
      'currentPage': instance.currentPage,
      'datum': instance.datum,
      'firstPageUrl': instance.firstPageUrl,
      'from': instance.from,
      'lastPage': instance.lastPage,
      'lastPageUrl': instance.lastPageUrl,
      'links': instance.links,
      'nextPageUrl': instance.nextPageUrl,
      'path': instance.path,
      'perPage': instance.perPage,
      'prevPageUrl': instance.prevPageUrl,
      'to': instance.to,
      'total': instance.total,
    };
