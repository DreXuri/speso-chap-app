import 'package:flutter_test/flutter_test.dart';
import 'package:spesco_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ChatServicServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}