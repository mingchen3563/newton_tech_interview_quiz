import 'package:flutter_test/flutter_test.dart';
import 'package:newton_tech_interview_quiz/data/dtos/launches_dto.dart';
import 'package:newton_tech_interview_quiz/data/mappers/spacex_flight_mapper.dart';
import 'package:newton_tech_interview_quiz/domain/value_objects/spacex_flight.dart';

void main() {
  final fakeLaunchesDto = LaunchesDto(
    flightNumber: 1,
    missionName: 'FalconSat',
    missionId: [],
    upcoming: false,
    launchYear: '2006',
    launchDateUnix: 1143239400,
    launchDateUtc: '2006-03-24T22:30:00.000Z',
    launchDateLocal: '2006-03-25T10:30:00+12:00',
    isTentative: false,
    tentativeMaxPrecision: 'hour',
    tbd: false,
    launchWindow: 0,
    rocket: RocketDto(
      rocketId: 'falcon1',
      rocketName: 'Falcon 1',
      rocketType: 'Merlin A',
      firstStage: FirstStageDto(cores: []),
      secondStage: SecondStageDto(block: 1, payloads: []),
      fairings: FairingsDto(
        reused: false,
        recoveryAttempt: false,
        recovered: false,
        ship: null,
      ),
    ),
    ships: [],
    telemetry: TelemetryDto(flightClub: null),
    launchSite: LaunchSiteDto(
      siteId: 'kwajalein_atoll',
      siteName: 'Kwajalein Atoll',
      siteNameLong: 'Kwajalein Atoll Omelek Island',
    ),
    launchSuccess: false,
    launchFailureDetails: LaunchFailureDetailsDto(
      time: 33,
      altitude: null,
      reason: 'merlin engine failure',
    ),
    links: LinksDto(
      missionPatch: 'https://images2.imgbox.com/40/e3/GypSkayF_o.png',
      missionPatchSmall: 'https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png',
      articleLink:
          'https://www.space.com/2196-spacex-inaugural-falcon-1-rocket-lost-launch.html',
      wikipedia: 'https://en.wikipedia.org/wiki/DemoSat',
      videoLink: 'https://www.youtube.com/watch?v=0a_00nJ_Y88',
      youtubeId: '0a_00nJ_Y88',
      flickrImages: [],
    ),
    details: 'Engine failure at 33 seconds and loss of vehicle',
    staticFireDateUtc: '2006-03-17T00:00:00.000Z',
    staticFireDateUnix: 1142553600,
    timeline: TimelineDto(webcastLiftoff: 54),
    crew: null,
  );

  test('spacex flight mapper ...', () async {
    final SpaceXFlight spaceXFlight =
        SpaceXFlightMapper.fromDto(fakeLaunchesDto);
    expect(spaceXFlight.flightNumber, 1);
    expect(spaceXFlight.missionName, 'FalconSat');
    final launchDateUtc = spaceXFlight.launchDate.toUtc();
    expect(launchDateUtc.year, 2006);
    expect(launchDateUtc.month, 3);
    expect(launchDateUtc.day, 24);
    expect(launchDateUtc.hour, 22);
    expect(launchDateUtc.minute, 30);
    expect(launchDateUtc.second, 0);
    expect(spaceXFlight.iconPath,
        'https://images2.imgbox.com/40/e3/GypSkayF_o.png');
    expect(spaceXFlight.articleLink,
        'https://www.space.com/2196-spacex-inaugural-falcon-1-rocket-lost-launch.html');
    expect(
        spaceXFlight.videoLink, 'https://www.youtube.com/watch?v=0a_00nJ_Y88');
    expect(spaceXFlight.wikiLink, 'https://en.wikipedia.org/wiki/DemoSat');
    expect(
        spaceXFlight.videoLink, 'https://www.youtube.com/watch?v=0a_00nJ_Y88');
  });
}
