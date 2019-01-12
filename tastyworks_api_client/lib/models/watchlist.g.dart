// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Watchlist _$WatchlistFromJson(Map<String, dynamic> json) {
  return Watchlist(
      json['name'] as String,
      (json['watchlist-entries'] as List)
          ?.map((e) => e == null
              ? null
              : WatchlistEntry.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$WatchlistToJson(Watchlist instance) => <String, dynamic>{
      'name': instance.name,
      'watchlist-entries': instance.watchlistEntries
    };
