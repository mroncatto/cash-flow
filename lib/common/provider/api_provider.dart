import 'package:dio/dio.dart';

class ApiProvider {
  Future<dynamic> get(
    String url,
  ) async {
    Dio dio = Dio();
    return await dio.get(url).then((response) => response).catchError((e) {});
  }
}
