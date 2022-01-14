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
import "package:flutter_test/flutter_test.dart";
import "package:flutter/material.dart";

// widgets
import "package:esamira/widgets/content_box.dart";
import "package:esamira/pages/fullscreen.dart";
import "package:esamira/widgets/button.dart";
import "package:esamira/widgets/appbar.dart";

// MiraApp
import "package:esamira/main.dart";

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
    // TODO(KristofKekesi): Implement it after rework.

    // CollectionItem
    // TODO(KristofKekesi): Implement it after rework.

    // ContentBox
    testWidgets("ContentBox", (WidgetTester tester) async {
      /// Using it with the child property.
      const Widget child = Text("child");

      await tester.pumpWidget(
        const MaterialApp(
          home: ContentBox(
            title: "title",
            child: child,
          ),
        ),
      );

      // Search elements
      final Finder titleFinder1 = find.text("title");
      final Finder childFinder = find.byWidget(child);

      // Verify
      expect(titleFinder1, findsOneWidget);
      expect(childFinder, findsOneWidget);

      /// Using it with the children property.
      const List<Widget> children = <Widget>[
        Text("first child of children"),
        Text("second child of children")
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: ContentBox(
            title: "title",
            children: children,
          ),
        ),
      );

      // Search elements
      final Finder titleFinder2 = find.text("title");

      // Search and verify children
      for (int index = 0; index < children.length; index++) {
        final Finder childrenFinder = find.byWidget(children[index]);
        expect(childrenFinder, findsOneWidget);
      }

      // Verify
      expect(titleFinder2, findsOneWidget);
    });

    // Button
    testWidgets("Button", (WidgetTester tester) async {
      await tester.pumpWidget(
        /// Value is a String.
        const MaterialApp(
          home: Button(
            titleFontSize: 16,
            valueFontSize: 16,
            title: "title",
            value: "value",
          ),
        ),
      );

      // Search elements
      final Finder titleFinder1 = find.text("title");
      final Finder valueFinder1 = find.text("value");

      // Verify
      expect(titleFinder1, findsOneWidget);
      expect(valueFinder1, findsOneWidget);

      /// Value is a Widget.
      const Widget child = Text("Widget");

      await tester.pumpWidget(
        const MaterialApp(
          home: Button(
            titleFontSize: 16,
            valueFontSize: 16,
            title: "title",
            value: child,
          ),
        ),
      );

      // Search elements
      final Finder titleFinder2 = find.text("title");
      final Finder valueFinder2 = find.byWidget(child);

      // Verify
      expect(titleFinder2, findsOneWidget);
      expect(valueFinder2, findsOneWidget);

      /// Testing action.
      bool variable = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Button(
            titleFontSize: 16,
            valueFontSize: 16,
            title: "title",
            value: "value",
            action: () {
              variable = true;
            },
          ),
        ),
      );

      // Click on the widget.
      await tester.tap(find.byType(GestureDetector));

      // Check variable's value.
      expect(variable, true);
    });

    // ImageBox
    // TODO(KristofKekesi): Implement it after reworked apod widget.

    // FullScreenImagePage
    testWidgets("FullScreenImagePage", (WidgetTester tester) async {
      await tester.pumpWidget(
        // Needs MiraApp because this widget required localization.
        MiraApp(
          child: FullScreen(
            image: Image.asset("assets/esa-black.png"),
          ),
        ),
      );
    });
  });
}
