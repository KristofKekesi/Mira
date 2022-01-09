// Flutter
import "package:flutter_test/flutter_test.dart";

// utils
import "package:ussrmira/utils/update.dart";
import "package:ussrmira/widgets/collection.dart";

void main() {
  test("Initial data update for NASA Mira", () {
    update(hardCodeData);
  });
}
