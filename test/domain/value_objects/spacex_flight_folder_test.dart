import 'package:flutter_test/flutter_test.dart';
import 'package:newton_tech_interview_quiz/domain/value_objects/spacex_flight.dart';
import 'package:newton_tech_interview_quiz/domain/value_objects/spacex_flight_folder.dart';

void main() {
  late SpaceXFlightFolder spaceXFlightFolder;

  final flightPatch1 = [
    SpaceXFlight(
      flightNumber: '1',
      missionName: 'Mission 1',
      launchDate: DateTime.now(),
      iconPath: 'icon_path_1',
      wikiLink: 'wiki_link_1',
      articleLink: 'article_link_1',
      videoLink: 'video_link_1',
    ),
    SpaceXFlight(
      flightNumber: '2',
      missionName: 'Mission 2',
      launchDate: DateTime.now(),
      iconPath: 'icon_path_2',
      wikiLink: 'wiki_link_2',
      articleLink: 'article_link_2',
      videoLink: 'video_link_2',
    ),
  ];
  final flightPatch2 = [
    SpaceXFlight(
      flightNumber: '3',
      missionName: 'Mission 3',
      launchDate: DateTime.now(),
      iconPath: 'icon_path_3',
      wikiLink: 'wiki_link_3',
      articleLink: 'article_link_3',
      videoLink: 'video_link_3',
    ),
  ];
  setUpAll(() {
    spaceXFlightFolder =
        SpaceXFlightFolder(flights: [], lastUpdatedTime: DateTime.now());
  });
  test('add flight to spacex flight folder ...', () {
    final oldUpdatedTime = spaceXFlightFolder.lastUpdatedTime;
    spaceXFlightFolder.addFlight(flightPatch1);
    expect(spaceXFlightFolder.flights, flightPatch1);
    expect(spaceXFlightFolder.lastUpdatedTime, isNot(oldUpdatedTime));
  });
  test('reload flights to spacex flight folder ...', () {
    final oldUpdatedTime = spaceXFlightFolder.lastUpdatedTime;
    spaceXFlightFolder.reloadFlights(flightPatch2);
    expect(spaceXFlightFolder.flights, flightPatch2);
    expect(spaceXFlightFolder.lastUpdatedTime, isNot(oldUpdatedTime));
  });
}
