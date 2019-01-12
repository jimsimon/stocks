import 'package:json_annotation/json_annotation.dart';

part 'watchlist_entry.g.dart';

@JsonSerializable()
class WatchlistEntry {
  final String instrumentType;
  final String symbol;

  WatchlistEntry(this.instrumentType, this.symbol);

  factory WatchlistEntry.fromJson(Map<String, dynamic> json) => _$WatchlistEntryFromJson(json);

  Map<String, dynamic> toJson() => _$WatchlistEntryToJson(this);

  @override
  String toString() {
    return 'WatchlistEntry{instrumentType: $instrumentType, symbol: $symbol}';
  }
}