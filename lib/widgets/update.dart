import 'package:dio/dio.dart';
import 'package:nasamira/pass.dart';

void update(data) async {
  for (int index = 0; index < data.length; index++) {
    if (data[index]["manifest"] != null) {
      Response response = await Dio().get(
          "${data[index]["manifest"]}?api_key=$apiKey");
      print(response.data["photo_manifest"]["name"]);

      // check state
      if (data[index]["status"] != "inactive" && response.data["photo_manifest"]["status"] == "complete") {
        print("state to inactive");
      } else if (data[index]["status"] != "active") {
        print("state to active");
      }

      // check max-date
      if (data[index]["max-date"] == null || "${data[index]["max-date"]["year"]}-${data[index]["max-date"]["month"]}-${data[index]["max-date"]["day"]}" != response.data["photo_manifest"]["max_date"] ) {
        print("max-date to " + response.data["photo_manifest"]["max_date"]);
      }

      // check max-sol
      if (data[index]["max-sol"] != response.data["photo_manifest"]["max_sol"]) {
        print("max-sol to " + response.data["photo_manifest"]["max_sol"].toString());
      }
    }
  }
  return data;
}