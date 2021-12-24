// Flutter
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// whole product
import 'package:nasamira/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('final product test', () {
    testWidgets('Does it run?', (WidgetTester tester) async {
      app.main();
    });
  });
}
