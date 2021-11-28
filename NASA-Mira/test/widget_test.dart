import 'package:flutter_test/flutter_test.dart';

import 'package:nasamira/main.dart';

void main() {
  testWidgets('HineScren', (WidgetTester tester) async {
    await tester.pumpWidget(HomeScreen());
  });
}