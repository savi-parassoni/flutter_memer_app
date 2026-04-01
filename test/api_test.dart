import 'package:flutter_memer/services/api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test Api ', () async {
    final response = await Api.getMemes();
    print(response.data!.memes.toString());
    expect(response.success, true);
  });
}
