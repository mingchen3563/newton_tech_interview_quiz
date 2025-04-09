import 'package:newton_tech_interview_quiz/data/dtos/launches_dto.dart';
import 'package:newton_tech_interview_quiz/domain/value_objects/spacex_flight.dart';

class SpaceXFlightMapper {
  static SpaceXFlight fromDto(LaunchesDto dto) {
    return SpaceXFlight(
      flightNumber: 'Flight ${dto.flightNumber}',
      missionName: dto.missionName,
      launchDate:
          DateTime.fromMillisecondsSinceEpoch(dto.launchDateUnix * 1000),
      iconPath: dto.links.missionPatch,
      articleLink: dto.links.articleLink,
      wikiLink: dto.links.wikipedia,
      videoLink: dto.links.videoLink,
    );
  }
}
