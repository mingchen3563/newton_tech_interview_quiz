import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:newton_tech_interview_quiz/services/api_service.dart';

import 'api_service_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late Dio dio;
  late ApiService apiService;
  setUpAll(() {
    dio = MockDio();
    apiService = ApiService(getDio: dio);
  });
  test('test injection', () {
    expect(apiService.testGetDio, dio);
  });
  group('test', () {
    test('verify get options', () {
      final targetOptions = ApiService.getOptions;

      expect(targetOptions.baseUrl, 'https://api.spacexdata.com');
      expect(targetOptions.connectTimeout, const Duration(seconds: 5));
      expect(targetOptions.sendTimeout, const Duration(seconds: 5));
      expect(targetOptions.receiveTimeout, const Duration(seconds: 5));
      expect(targetOptions.receiveDataWhenStatusError, true);
    });
    test('test get with status code 200', () async {
      final String testPath = 'testpath';
      final Response testResponse = Response(
        requestOptions: RequestOptions(),
        data: {'test_key': 'test_value'},
        statusCode: 200,
      );
      when(dio.get(testPath)).thenAnswer((_) async => testResponse);
      final response = await apiService.get(testPath);
      verify(dio.get(testPath)).called(1);
      expect(response, testResponse);
      expect(response.data, {'test_key': 'test_value'});
      expect(response.statusCode, 200);
    });
    test('test get with status code 400', () async {
      final String testPath = 'testpath';
      final Response testResponse = Response(
        requestOptions: RequestOptions(),
        data: {'test_key': 'test_value'},
        statusCode: 400,
      );
      when(dio.get(testPath)).thenAnswer((_) async => testResponse);
      final response = await apiService.get(testPath);
      verify(dio.get(testPath)).called(1);
      expect(response, testResponse);
      expect(response.data, {'test_key': 'test_value'});
      expect(response.statusCode, 400);
    });
  });
}
