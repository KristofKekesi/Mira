// Flutter
import 'package:flutter_test/flutter_test.dart';

// pages
import '../lib/pages/homePage.dart';

void main() {
  // HomePage
  testWidgets('HomePage', (WidgetTester tester) async {
    await tester.pumpWidget(HomePage());
  });
}