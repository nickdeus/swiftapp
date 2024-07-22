import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiService extends GetxService {
  static const String baseUrl = 'https://swiftcargo.co.tz/cargo-v1';
  // static const String baseUrl = 'https://www.carambola.co.tz';
  late Dio _dio;
  String? _token = "OTQ0ZTU3ZjdhYTdiZGRjZGIyOGQ0MGNkZDA5ZmEwY2U";
  @override
  void onInit() {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (_token != null) {
          options.headers['Authorization'] = 'Bearer $_token';
        }
        return handler.next(options); // continue
      },
    ));
    super.onInit();
  }

  void setToken(String token) {
    _token = token;
  }

  Future getRequest(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response;
    } on DioError catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future postRequest(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } on DioError catch (e) {
      _handleError(e);
      rethrow;
    }
  }





  void _handleError(DioError error) {
    if (error.response != null) {
      print('Dio error!');
      print('STATUS: ${error.response?.statusCode}');
      print('DATA: ${error.response?.data}');
      print('HEADERS: ${error.response?.headers}');
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      print('Error sending request!');
      print(error.message);
    }
  }
}