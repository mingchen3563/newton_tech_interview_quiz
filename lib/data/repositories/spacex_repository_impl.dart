import 'package:get_it/get_it.dart';
import 'package:newton_tech_interview_quiz/data/dtos/launches_dto.dart';
import 'package:newton_tech_interview_quiz/data/mappers/spacex_flight_mapper.dart';
import 'package:newton_tech_interview_quiz/data/remote_data_sources/remote_v3_data_source.dart';
import 'package:newton_tech_interview_quiz/domain/repositories/spacex_repository.dart';
import 'package:newton_tech_interview_quiz/domain/value_objects/spacex_flight.dart';

class SpaceXRepositoryImpl extends SpaceXRepository {
  final RemoteV3DataSource remoteV3DataSource;
  SpaceXRepositoryImpl({RemoteV3DataSource? remoteV3DataSource})
      : remoteV3DataSource =
            remoteV3DataSource ?? GetIt.I.get<RemoteV3DataSource>();
  @override
  Future<List<SpaceXFlight>> getLaunches() async {
    final List<LaunchesDto> response = await remoteV3DataSource.getLaunches();
    final launches = response.map((dto) {
      return SpaceXFlightMapper.fromDto(dto);
    });
    return launches.toList();
  }
}
