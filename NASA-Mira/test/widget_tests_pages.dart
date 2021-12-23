// Flutter
import 'package:flutter_test/flutter_test.dart';
import 'package:nasamira/pages/date_picker.dart';

// pages
import 'package:nasamira/pages/home_page.dart';
import 'package:nasamira/pages/drawer.dart';
import 'package:nasamira/pages/image_search.dart';
import 'package:nasamira/pages/rover_spec_page.dart';
import 'package:nasamira/pages/vehicle_search.dart';

void main() {
  group('Pages', () {
    // HomePage
    testWidgets('HomePage', (WidgetTester tester) async {
      await tester.pumpWidget(const HomePage());
    });
    // Drawer
    testWidgets('Drawer', (WidgetTester tester) async {
      await tester.pumpWidget(const SidebarDrawer());
    });
    // SpecificationPage
    testWidgets('SpecPage', (WidgetTester tester) async {
      await tester.pumpWidget(const RoverSpecPage(dataSector: 9, name: "test", type: "rover", operator: "NASA", manufacturer: "JPL"));
    });
    // VehicleSearch
    testWidgets('VehicleSearch', (WidgetTester tester) async {
      await tester.pumpWidget(const VehicleSearch(type: "mission", value: "test"));
    });
    // DatePicker
    testWidgets('DatePicker', (WidgetTester tester) async {
      await tester.pumpWidget(const DatePickerPage(dataSector: 9));
    });
    // ImageSearch
    testWidgets('ImageSearch', (WidgetTester tester) async {
      await tester.pumpWidget(const SearchWindow(name: "name", url: "https://api.nasa.gov/mars-photos/api/v1/rovers/perseverance/photos?sol=10&api_key=DEMO_KEY", time: "time"));
    });
  });
}
