// Flutter
import "package:flutter_test/flutter_test.dart";

// utils
import "package:esamira/widgets/collection.dart";
import "package:esamira/utils/update.dart";

void main() {
  test("Initial data update for NASA Mira", () {
    update(hardCodeData);
  });
}
