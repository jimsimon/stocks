import 'package:iex_trading_client/vm_client.dart';
import 'package:test/test.dart';

void main() {
  group('VM Client', () {
    final VmClient client = new VmClient();

    test('getSymbols', () async {
      expect(await client.getSymbols(), hasLength(greaterThan(0)));
    });
  });
}
