import 'package:newton_tech_interview_quiz/domain/value_objects/spacex_flight.dart';

abstract class SpaceXRepository {
  Future<List<SpaceXFlight>> getLaunches();
}
