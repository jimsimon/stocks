class SymbolSearchResult {
  final String symbol;
  final String name;
  final String type;

  SymbolSearchResult(this.symbol, this.name, this.type);

  factory SymbolSearchResult.fromJson(json) {
    return new SymbolSearchResult(json[0], json[1], json[2]);
  }

  @override
  String toString() {
    return 'SymbolSearchResult{symbol: $symbol, name: $name, type: $type}';
  }
}