import 'package:dio/dio.dart';

class ApiService {
  final Dio _getDio;

  ApiService({Dio? getDio}) : _getDio = getDio ?? configureGetDio();

  Dio get testGetDio => _getDio;

  static final getOptions = BaseOptions(
    baseUrl: 'https://api.spacexdata.com',
    connectTimeout: const Duration(seconds: 5),
    sendTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    receiveDataWhenStatusError: true,
  );

  static Dio configureGetDio() {
    final dio = Dio();
    dio.options = getOptions;
    return dio;
  }

  Future<Response> get(String path) async {
    return await _getDio.get(path);
  }
}
