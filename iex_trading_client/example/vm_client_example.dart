import 'package:iex_trading_client/vm_client.dart';

void main() async {
  final VmClient client = new VmClient();

  List<StockSymbol> symbols = await client.getSymbols();
  print(symbols.length);
}
