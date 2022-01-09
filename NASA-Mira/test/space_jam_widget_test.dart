// TODO(KristofKekesi): add tests for the following widgets:
// - PageBuilder
// - AppBar
// - Collection
// - CollectionItem
// - ContentBox
// - Button
// - ImageBox
// - FullScreen

// - SpaceJamTheme
// - IconStyle

// Flutter
import "package:flutter/material.dart";
import "package:nasamira/widgets/appbar.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nasamira/widgets/collection.dart";

// widgets

void main() {
  group("SpaceJam Widgets", () {
    // PageBuilder
    // TODO(KristofKekesi): Implement it after sliver in Appbar.

    // Appbar
    testWidgets("AppBar", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Appbar(
            title: "title",
            subtitle: "subtitle",
            leftAction: AppBarAction(icon: Icons.add),
            rightAction: AppBarAction(icon: Icons.remove),
          ),
        ),
      );

      // Search elements
      final Finder titleFinder = find.text("title");
      final Finder subtitleFinder = find.text("subtitle");
      final Finder leftIconFinder = find.byIcon(Icons.add);
      final Finder rightIconFinder = find.byIcon(Icons.remove);

      // Verify
      expect(titleFinder, findsOneWidget);
      expect(subtitleFinder, findsOneWidget);
      expect(leftIconFinder, findsOneWidget);
      expect(rightIconFinder, findsOneWidget);
    });

    // Collection
    testWidgets("Collection", (WidgetTester tester) async {
      // Visible
      await tester.pumpWidget(
        MaterialApp(
          home: Collection(
            inputType: "type",
            filter: "orbiter",
            outputType: "type",
            isVisible: ValueNotifier<bool>(true),
          ),
        ),
      );

      // Search elements
      final Finder titleFinder = find.text("title");
      final Finder subtitleFinder = find.text("subtitle");
      final Finder iconFinder = find.byIcon(Icons.arrow_forward_rounded);

      // Verify
      expect(titleFinder, findsOneWidget);
      expect(subtitleFinder, findsOneWidget);
      expect(iconFinder, findsOneWidget);
    });
    // CollectionItem
    // ContentBox
    // Button
    // ImageBox
    // FullScreenImagePage
  });
}
