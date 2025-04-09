class SpaceXFlight {
  final String flightNumber;
  final String missionName;
  final DateTime launchDate;
  final String? iconPath;
  final String? wikiLink;
  final String? articleLink;
  final String? videoLink;
  SpaceXFlight({
    required this.flightNumber,
    required this.missionName,
    required this.launchDate,
    required this.iconPath,
    required this.wikiLink,
    required this.articleLink,
    required this.videoLink,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SpaceXFlight) return false;
    return flightNumber == other.flightNumber &&
        missionName == other.missionName &&
        launchDate == other.launchDate;
  }

  @override
  int get hashCode =>
      flightNumber.hashCode ^ missionName.hashCode ^ launchDate.hashCode;
}
