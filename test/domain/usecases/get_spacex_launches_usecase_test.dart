import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
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
          SpaceXFlight(
            flightNumber: 110,
            missionName: 'CRS-21',
            launchDate: DateTime.fromMillisecondsSinceEpoch(1607271420 * 1000),
            articleLink: null,
            wikiLink: null,
            videoLink: null,
            iconPath: 'https://imgur.com/E7fjUBD.png',
          )
        ]);
    final launches = await getSpaceXLaunchesUsecase();
    expect(launches, isA<List<SpaceXFlight>>());
    expect(launches.length, 1);
    expect(launches[0].flightNumber, 110);
    expect(launches[0].missionName, 'CRS-21');
    expect(launches[0].launchDate,
        DateTime.fromMillisecondsSinceEpoch(1607271420 * 1000));
    expect(launches[0].articleLink, null);
    expect(launches[0].wikiLink, null);
    expect(launches[0].videoLink, null);
    expect(launches[0].iconPath, 'https://imgur.com/E7fjUBD.png');
  });
}
