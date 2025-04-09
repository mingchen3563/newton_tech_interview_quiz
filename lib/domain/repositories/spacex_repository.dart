import 'package:newton_tech_interview_quiz/data/dtos/launches_dto.dart';

abstract class SpaceXRepository {
  Future<List<LaunchesDto>> getLaunches();
}
