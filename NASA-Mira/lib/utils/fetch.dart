import "package:dio/dio.dart";

/// A future which fetches the URL passed with the [url] parameter.
Future<Response<dynamic>> fetchAPI(String url) async {
  final Dio dio = Dio();
  dio.options.connectTimeout = 5000;
  dio.options.receiveTimeout = 30000;
  final Response<dynamic> response = await dio.get(url);

  return response;
}
