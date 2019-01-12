// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatchlistEntry _$WatchlistEntryFromJson(Map<String, dynamic> json) {
  return WatchlistEntry(
      json['instrument-type'] as String, json['symbol'] as String);
}

Map<String, dynamic> _$WatchlistEntryToJson(WatchlistEntry instance) =>
    <String, dynamic>{
      'instrument-type': instance.instrumentType,
      'symbol': instance.symbol
    };
