// Flutter
import 'package:flutter_test/flutter_test.dart';

// utils
import 'package:nasamira/utils/update.dart';
import 'package:nasamira/widgets/collection.dart';

void main() {
  test('Initial data update for NASA Mira', () {
    update(hardCodeData);
  });
}