// Flutter
import 'package:flutter_test/flutter_test.dart';

// pages
import 'package:nasamira/pages/home_page.dart';

void main() {
  // HomePage
  testWidgets('HomePage', (WidgetTester tester) async {
    await tester.pumpWidget(const HomePage());
  });
}