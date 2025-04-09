import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newton_tech_interview_quiz/domain/usecases/get_spacex_launches_usecase.dart';
import 'package:newton_tech_interview_quiz/domain/value_objects/spacex_flight_folder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'all_launches_viewmodel.g.dart';

@riverpod
Future<SpaceXFlightFolder> spaceXFlightFolder(Ref ref) async {
  final spaceXFlights = await GetSpaceXLaunchesUsecase().call();
  return SpaceXFlightFolder(
    flights: spaceXFlights,
    lastUpdatedTime: DateTime.now(),
  );
}

@riverpod
class SpaceXFlightSortNotifier extends _$SpaceXFlightSortNotifier {
  @override
  SpaceXFlightSort build() {
    return SpaceXFlightSort.descending;
  }

  void toggleSort() {
    state = state == SpaceXFlightSort.ascending
        ? SpaceXFlightSort.descending
        : SpaceXFlightSort.ascending;
  }
}

enum SpaceXFlightSort {
  ascending,
  descending;
}
