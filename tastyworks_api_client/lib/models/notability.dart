import 'package:json_annotation/json_annotation.dart';

part 'notability.g.dart';

@JsonSerializable()
class Notability {
  final String name;
  final String description;

  Notability(this.name, this.description);

  factory Notability.fromJson(Map<String, dynamic> json) =>
    _$NotabilityFromJson(json);

  Map<String, dynamic> toJson() => _$NotabilityToJson(this);

  @override
  String toString() {
    return 'Notability{name: $name, description: $description}';
  }
}