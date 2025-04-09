import 'package:newton_tech_interview_quiz/domain/value_objects/spacex_flight.dart';

class SpaceXFlightFolder {
  final List<SpaceXFlight> flights;
  DateTime lastUpdatedTime;

  SpaceXFlightFolder({
    required this.flights,
    required this.lastUpdatedTime,
  });

  void addFlight(List<SpaceXFlight> newFlights) {
    flights.addAll(newFlights);
    lastUpdatedTime = DateTime.now();
  }

  void reloadFlights(List<SpaceXFlight> newFlights) {
    flights.clear();
    flights.addAll(newFlights);
    lastUpdatedTime = DateTime.now();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SpaceXFlightFolder) return false;
    return flights == other.flights && lastUpdatedTime == other.lastUpdatedTime;
  }

  @override
  int get hashCode => flights.hashCode ^ lastUpdatedTime.hashCode;
}
