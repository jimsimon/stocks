import 'package:json_annotation/json_annotation.dart';
import 'package:tastyworks_api_client/models/watchlist_entry.dart';

part 'watchlist.g.dart';

@JsonSerializable()
class Watchlist {
  final String name;
  final List<WatchlistEntry> watchlistEntries;

  Watchlist(this.name, this.watchlistEntries);

  factory Watchlist.fromJson(Map<String, dynamic> json) =>
    _$WatchlistFromJson(json);

  Map<String, dynamic> toJson() => _$WatchlistToJson(this);

  @override
  String toString() {
    return 'Watchlist{name: $name, watchlistEntries: $watchlistEntries}';
  }
}