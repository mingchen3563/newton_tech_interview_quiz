import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:newton_tech_interview_quiz/data/dtos/launches_dto.dart';
import 'package:newton_tech_interview_quiz/data/mappers/spacex_flight_mapper.dart';
import 'package:newton_tech_interview_quiz/domain/repositories/spacex_repository.dart';
import 'package:newton_tech_interview_quiz/domain/value_objects/spacex_flight.dart';

class GetSpaceXLaunchesUsecase {
  final SpaceXRepository spaceXRepository;
  GetSpaceXLaunchesUsecase({SpaceXRepository? spaceXRepository})
      : spaceXRepository = spaceXRepository ?? GetIt.I.get<SpaceXRepository>();
  Future<List<SpaceXFlight>> call() async {
    final List<LaunchesDto> launches;
    try {
      launches = await spaceXRepository.getLaunches();
    } catch (e, s) {
      log('Error getting launches', error: e, stackTrace: s);
      throw e;
    }
    return launches
        .map((launch) => SpaceXFlightMapper.fromDto(launch))
        .toList();
  }
}
