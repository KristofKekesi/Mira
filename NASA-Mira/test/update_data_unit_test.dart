// Flutter
import 'package:flutter_test/flutter_test.dart';

// utils
import 'package:nasamira/utils/update.dart';
import 'package:nasamira/widgets/rover_grid.dart';

void main() {
  test('Initial data update for NASA Mira', () {
    update(hardCodeData);
  });
}