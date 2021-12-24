// Dart
import 'package:dio/dio.dart';

// utils
import 'extensions.dart';
import '../pass.dart';


late List<dynamic> localUpdate;
bool updated = false;

Future<void> update(data) async {
  for (int index = 0; index < data.length; index++) {
    if (data[index]["manifest"] != null) {
      Response<dynamic> response = await Dio().get(
          "${data[index]["manifest"]}?api_key=$apiKey");

      // check state
      if (data[index]["status"] != "inactive" && response.data["photo_manifest"]["status"] == "complete") {
        data[index]["status"] = "inactive";
      } else if (data[index]["status"] != "active" && response.data["photo_manifest"]["status"] != "complete") {
        data[index]["status"] = "active";
      }

      // check last-date
      if (data[index]["last-date"] == null || "${data[index]["last-date"]["year"]}-${spacerZeros(data[index]["last-date"]["month"])}-${spacerZeros(data[index]["last-date"]["day"])}" != response.data["photo_manifest"]["max_date"] ) {
        data[index]["last-date"]["year"] = int.parse(response.data["photo_manifest"]["max_date"].split("-")[0]);
        data[index]["last-date"]["month"] = int.parse(response.data["photo_manifest"]["max_date"].split("-")[1]);
        data[index]["last-date"]["day"] = int.parse(response.data["photo_manifest"]["max_date"].split("-")[2]);
      }

      // check last-sol
      if (data[index]["last-sol"] != response.data["photo_manifest"]["max_sol"]) {
        data[index]["last-sol"] = response.data["photo_manifest"]["max_sol"];
      }
    }
  }

  localUpdate = data;
  updated = true;
}