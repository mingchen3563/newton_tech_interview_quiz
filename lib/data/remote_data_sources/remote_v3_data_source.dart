import 'package:newton_tech_interview_quiz/data/dtos/launches_dto.dart';
import 'package:newton_tech_interview_quiz/services/api_service.dart';

class RemoteV3DataSource {
  final ApiService apiService;

  RemoteV3DataSource({ApiService? apiService})
      : apiService = apiService ?? ApiService();

  Future<List<LaunchesDto>> getLaunches() async {
    final response = await apiService.get('/v3/launches');
    final code = response.statusCode;
    return switch (code) {
      200 => (response.data as List<dynamic>)
          .map((launchdata) => LaunchesDto.fromJson(launchdata))
          .toList(),
      _ => throw Exception('api error'),
    };
  }
}
