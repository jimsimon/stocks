import 'package:json_annotation/json_annotation.dart';

part 'research_team.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ResearchTeam {
  @JsonKey(name: 'corr_SPY_3month')
  final String corrSPY3month;

  ResearchTeam(this.corrSPY3month);

  factory ResearchTeam.fromJson(Map<String, dynamic> json) =>
    _$ResearchTeamFromJson(json);

  Map<String, dynamic> toJson() => _$ResearchTeamToJson(this);

  @override
  String toString() {
    return 'ResearchTeam{corrSPY3month: $corrSPY3month}';
  }
}