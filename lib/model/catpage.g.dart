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
      'current_page': instance.currentPage,
      'data': instance.datum,
      'first_page_url': instance.firstPageUrl,
      'from': instance.from,
      'last_page': instance.lastPage,
      'last_page_url': instance.lastPageUrl,
      'links': instance.links,
      'next_page_url': instance.nextPageUrl,
      'path': instance.path,
      'per_page': instance.perPage,
      'prev_page_url': instance.prevPageUrl,
      'to': instance.to,
      'total': instance.total,
    };
