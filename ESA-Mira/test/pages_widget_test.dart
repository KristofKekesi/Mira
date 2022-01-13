// Flutter
import "package:flutter_test/flutter_test.dart";

// MiraApp
import "package:esamira/main.dart";

// pages
import "package:esamira/pages/vehicle_spec_page.dart";
import "package:esamira/pages/vehicle_search.dart";
import "package:esamira/pages/image_search.dart";
import "package:esamira/pages/date_picker.dart";
import "package:esamira/pages/home_page.dart";
import "package:esamira/pages/drawer.dart";

void main() {
  group("Pages", () {
    // HomePage
    testWidgets("HomePage", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MiraApp(
          child: HomePage(),
        ),
      );
    });

    // Drawer
    testWidgets("Drawer", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MiraApp(
          child: SidebarDrawer(),
        ),
      );
    });

    // SpecificationPage
    testWidgets("SpecPage", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MiraApp(
          child: RoverSpecPage(
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
          child: VehicleSearch(type: "mission", value: "test"),
        ),
      );
    });

    // DatePickerPage
    testWidgets("DatePickerPage", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MiraApp(
          child: DatePickerPage(dataSector: 9),
        ),
      );
    });

    // ImageSearchPage
    testWidgets("ImageSearchPage", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MiraApp(
          child: SearchWindow(
              name: "name",
              url:
                  "https://api.nasa.gov/mars-photos/api/v1/rovers/perseverance/photos?sol=10&api_key=DEMO_KEY",
              time: "time",),
        ),
      );
    });
  });
}
