import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:newton_tech_interview_quiz/data/dtos/launches_dto.dart';
import 'package:newton_tech_interview_quiz/data/repositories/spacex_repository_impl.dart';
import 'package:newton_tech_interview_quiz/domain/repositories/spacex_repository.dart';
import 'package:newton_tech_interview_quiz/domain/usecases/get_spacex_launches_usecase.dart';
import 'package:newton_tech_interview_quiz/domain/value_objects/spacex_flight.dart';

import 'get_spacex_launches_usecase_test.mocks.dart';

@GenerateMocks([SpaceXRepositoryImpl])
void main() {
  late GetSpaceXLaunchesUsecase getSpaceXLaunchesUsecase;
  late SpaceXRepository spaceXRepository;
  setUp(() {
    spaceXRepository = MockSpaceXRepositoryImpl();
    getSpaceXLaunchesUsecase =
        GetSpaceXLaunchesUsecase(spaceXRepository: spaceXRepository);
  });
  test('get spacex launches usecase ...', () async {
    when(spaceXRepository.getLaunches()).thenAnswer((_) async => [
          LaunchesDto(
              flightNumber: 110,
              missionName: 'CRS-21',
              missionId: ['EE86F74'],
              upcoming: true,
              launchYear: '2020',
              launchDateUnix: 1607271420,
              launchDateUtc: '2020-12-06T16:17:00.000Z',
              launchDateLocal: '2020-12-06T11:17:00-05:00',
              isTentative: false,
              tentativeMaxPrecision: 'hour',
              tbd: false,
              launchWindow: null,
              rocket: RocketDto(
                  rocketId: 'falcon9',
                  rocketName: 'Falcon 9',
                  rocketType: 'FT',
                  firstStage: FirstStageDto(cores: [
                    CoreDto(
                        coreSerial: 'B1058',
                        flight: 4,
                        block: 5,
                        gridfins: true,
                        legs: true,
                        reused: true,
                        landSuccess: null,
                        landingIntent: true,
                        landingType: 'ASDS',
                        landingVehicle: null)
                  ]),
                  secondStage: SecondStageDto(block: 5, payloads: [
                    PayloadDto(
                      payloadId: 'CRS-21',
                      noradId: [],
                      reused: true,
                      customers: ['NASA (CRS)'],
                      nationality: 'United States',
                      manufacturer: 'SpaceX',
                      payloadType: 'Dragon 2.0',
                      payloadMassKg: null,
                      payloadMassLbs: null,
                      orbit: 'ISS',
                      orbitParams: OrbitParamsDto(
                          referenceSystem: 'geocentric',
                          regime: 'low-earth',
                          longitude: null,
                          semiMajorAxisKm: null,
                          eccentricity: null,
                          periapsisKm: null,
                          apoapsisKm: null,
                          inclinationDeg: null,
                          periodMin: null,
                          lifespanYears: null,
                          epoch: null,
                          meanMotion: null,
                          raan: null,
                          argOfPericenter: null,
                          meanAnomaly: null),
                    )
                  ]),
                  fairings: null),
              ships: [],
              telemetry: TelemetryDto(flightClub: null),
              launchSite: LaunchSiteDto(
                  siteId: 'ksc_lc_39a',
                  siteName: 'KSC LC 39A',
                  siteNameLong:
                      'Kennedy Space Center Historic Launch Complex 39A'),
              launchSuccess: null,
              launchFailureDetails: null,
              links: LinksDto(
                  missionPatch: 'https://imgur.com/E7fjUBD.png',
                  missionPatchSmall: 'https://imgur.com/jHNFSY6.png',
                  redditCampaign:
                      'https://www.reddit.com/r/spacex/comments/jw8bfe/crs21_launch_campaign_thread/',
                  redditLaunch: null,
                  redditRecovery: null,
                  redditMedia: null,
                  presskit: null,
                  articleLink: null,
                  wikipedia: null,
                  videoLink: null,
                  youtubeId: null,
                  flickrImages: []),
              details:
                  'SpaceX\'s 21st ISS resupply mission on behalf of NASA and the first under the CRS-2 contract, this mission brings essential supplies to the International Space Station using the cargo variant of SpaceX\'s Dragon 2 spacecraft. The external payload for this mission is the Nanoracks Bishop Airlock. Falcon 9 and Dragon launch from LC-39A, Kennedy Space Center and the booster is expected to land on an ASDS. The mission will be complete with return and recovery of the Dragon capsule and down cargo.',
              staticFireDateUtc: null,
              staticFireDateUnix: null,
              timeline: null,
              crew: null)
        ]);
    final launches = await getSpaceXLaunchesUsecase();
    expect(launches, isA<List<SpaceXFlight>>());
    expect(launches.length, 1);
    expect(launches[0].flightNumber, 110);
    expect(launches[0].missionName, 'CRS-21');
    expect(launches[0].launchDate, DateTime.fromMillisecondsSinceEpoch(1607271420*1000));
    expect(launches[0].articleLink, null);
    expect(launches[0].wikiLink, null);
    expect(launches[0].videoLink, null);
    expect(launches[0].iconPath, 'https://imgur.com/E7fjUBD.png');
  });
}
