import 'package:dio/dio.dart';

class ApiProvider {
  Future<dynamic> get(
    String url,
  ) async {
    Dio dio = Dio();
    return await dio.get(url).then((response) => response).catchError((e) {});
  }

  Future<dynamic> put(String url) async {
    Dio dio = Dio();
    return await dio.put(url).then((response) => response).catchError((e) {
      throw Exception(e);
    });
  }

  Future<dynamic> post(String url, Map<String, dynamic> data) async {
    Dio dio = Dio();
    return await dio
        .post(url, data: data)
        .then((response) => response)
        .catchError((e) {
      throw Exception(e);
    });
  }
}
