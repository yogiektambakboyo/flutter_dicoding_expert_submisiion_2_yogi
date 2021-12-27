import 'package:m_core/m_core.dart';
import 'package:m_core/src/utils/shared.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SSL Pinning Http ', () {
    test(
      'Should get response 200 when success connect',
      () async {
        final _client = await Shared.createLEClient(isTestMode: true);
        final response = await _client.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY'));
        expect(response.statusCode, 200);
        _client.close();
      },
    );
  });
}
