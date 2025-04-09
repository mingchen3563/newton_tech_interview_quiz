import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:newton_tech_interview_quiz/data/remote_data_sources/remote_v3_data_source.dart';
import 'package:newton_tech_interview_quiz/services/api_service.dart';

import 'remote_v3_data_source_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late ApiService mockApiService;
  late RemoteV3DataSource remoteV3DataSource;

  setUpAll(() {
    mockApiService = MockApiService();
    remoteV3DataSource = RemoteV3DataSource(apiService: mockApiService);
  });
  group('test get launches', () {
    test('test get launches with status code 200', () async {
      when(mockApiService.get('/v3/launches')).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(),
        data: {'test_key': 'test_value'},
        statusCode: 200,
      ));
      final response = await remoteV3DataSource.getLaunches();
      expect(response, {'test_key': 'test_value'});
    });
    test('test get launches with status code 400', () async {
      when(mockApiService.get('/v3/launches')).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(),
        data: {'test_key': 'test_value'},
        statusCode: 400,
      ));
      expect(() => remoteV3DataSource.getLaunches(), throwsException);
    });
  });
}
