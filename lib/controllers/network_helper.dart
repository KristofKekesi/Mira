import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/model.dart';

class GetData {
  String getPath(url) {
    return url;
  }

  Future<List<Data>> getData(url) async {
    final res = await http.get(getPath(url));

    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      List data = json['photos'];
      return data.map((employees) => new Data.fromJson(employees)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
