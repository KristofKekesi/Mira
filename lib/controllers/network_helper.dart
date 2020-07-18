import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/model.dart';

const url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=100&api_key=<KEY>";

class GetData {
  String getPath() {
    return url;
  }

  Future<List<Data>> getData() async {
    final res = await http.get(getPath());

    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      List data = json['photos'];
      return data.map((employees) => new Data.fromJson(employees)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
