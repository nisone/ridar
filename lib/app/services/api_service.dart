import 'package:dio/dio.dart';
import 'package:ridar/app/data/constants.dart';
import 'package:ridar/app/extensions/strings.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Map<String, dynamic>> register(Map<String, dynamic> data) async {
    final response = await dio.post(registerUrl, data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> login(Map<String, dynamic> data) async {
    final response = await dio.post(loginUrl, data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> logout(int id) async {
    final response = await dio.delete(logoutUrl.placeholders({'id': id}));
    return response.data;
  }
}
