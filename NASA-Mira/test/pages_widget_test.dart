// Flutter
import "package:flutter_test/flutter_test.dart";

// MiraApp
import "package:nasamira/main.dart";

// pages
import "package:nasamira/pages/home_page.dart";
import "package:nasamira/pages/date_picker.dart";
import "package:nasamira/pages/drawer.dart";
import "package:nasamira/pages/image_search.dart";
import "package:nasamira/pages/vehicle_spec_page.dart";
import "package:nasamira/pages/vehicle_search.dart";

void main() {
  group("Pages", () {
    // HomePage
    testWidgets("HomePage", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MiraApp(
          home: HomePage(),
        ),
      );
    });

    // Drawer
    testWidgets("Drawer", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MiraApp(
          home: SidebarDrawer(),
        ),
      );
    });

    // SpecificationPage
    testWidgets("SpecPage", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MiraApp(
          home: RoverSpecPage(
              dataSector: 9,
              name: "test",
              type: "rover",
              operator: <String>["NASA"],
              manufacturer: "JPL",),
        ),
      );
    });

    // VehicleSearchPage
    testWidgets("VehicleSearchPage", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MiraApp(
          home: VehicleSearch(type: "mission", value: "test"),
        ),
      );
    });

    // DatePickerPage
    testWidgets("DatePickerPage", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MiraApp(
          home: DatePickerPage(dataSector: 9),
        ),
      );
    });

    // ImageSearchPage
    testWidgets("ImageSearchPage", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MiraApp(
          home: SearchWindow(
              name: "name",
              url:
                  "https://api.nasa.gov/mars-photos/api/v1/rovers/perseverance/photos?sol=10&api_key=DEMO_KEY",
              time: "time",),
        ),
      );
    });
  });
}
