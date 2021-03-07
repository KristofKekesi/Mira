import 'package:dio/dio.dart';
import 'package:nasamira/pass.dart';

List<dynamic> localUpdate;
bool updated = false;

String checkNull(int num) {
  if (num != null && num < 10) {
    return "0" + num.toString();
  } else {
    return num.toString();
  }
}

Future<void> update(data) async {
  for (int index = 0; index < data.length; index++) {
    if (data[index]["manifest"] != null) {
      Response response = await Dio().get(
          "${data[index]["manifest"]}?api_key=$apiKey");
      print(response.data["photo_manifest"]["name"]);

      // check state
      if (data[index]["status"] != "inactive" && response.data["photo_manifest"]["status"] == "complete") {
        print("state to inactive");
        data[index]["status"] = "inactive";
      } else if (data[index]["status"] != "active" && response.data["photo_manifest"]["status"] != "complete") {
        print("state to active");
        data[index]["status"] = "active";
      }

      // check last-date
      if (data[index]["last-date"] == null || "${data[index]["last-date"]["year"]}-${checkNull(data[index]["last-date"]["month"])}-${checkNull(data[index]["last-date"]["day"])}" != response.data["photo_manifest"]["max_date"] ) {
        print("last-date to " + response.data["photo_manifest"]["max_date"] + " from ${data[index]["last-date"]["year"]}-${checkNull(data[index]["last-date"]["month"])}-${checkNull(data[index]["last-date"]["day"])}");
        data[index]["last-date"]["year"] = int.parse(response.data["photo_manifest"]["max_date"].split("-")[0]);
        data[index]["last-date"]["month"] = int.parse(response.data["photo_manifest"]["max_date"].split("-")[1]);
        data[index]["last-date"]["day"] = int.parse(response.data["photo_manifest"]["max_date"].split("-")[2]);
      }

      // check last-sol
      if (data[index]["last-sol"] != response.data["photo_manifest"]["max_sol"]) {
        print("last-sol to " + response.data["photo_manifest"]["max_sol"].toString() + " from " + data[index]["last -sol"].toString());
        data[index]["last-sol"] = response.data["photo_manifest"]["max_sol"];
      }
    }
  }

  localUpdate = data;
  updated = true;
}