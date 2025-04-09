import 'package:newton_tech_interview_quiz/infra/extensions.dart';

class LaunchesDto {
  final int flightNumber;
  final String missionName;
  final List<String> missionId;
  final bool upcoming;
  final String launchYear;
  final int launchDateUnix;
  final String launchDateUtc;
  final String launchDateLocal;
  final bool isTentative;
  final String tentativeMaxPrecision;
  final bool tbd;
  final int? launchWindow;
  final RocketDto rocket;
  final List<String> ships;
  final TelemetryDto telemetry;
  final LaunchSiteDto launchSite;
  final bool? launchSuccess;
  final LaunchFailureDetailsDto? launchFailureDetails;
  final LinksDto links;
  final String details;
  final String? staticFireDateUtc;
  final int? staticFireDateUnix;
  final TimelineDto? timeline;
  final dynamic crew;

  LaunchesDto({
    required this.flightNumber,
    required this.missionName,
    required this.missionId,
    required this.upcoming,
    required this.launchYear,
    required this.launchDateUnix,
    required this.launchDateUtc,
    required this.launchDateLocal,
    required this.isTentative,
    required this.tentativeMaxPrecision,
    required this.tbd,
    required this.launchWindow,
    required this.rocket,
    required this.ships,
    required this.telemetry,
    required this.launchSite,
    required this.launchSuccess,
    this.launchFailureDetails,
    required this.links,
    required this.details,
    this.staticFireDateUtc,
    this.staticFireDateUnix,
    required this.timeline,
    this.crew,
  });

  factory LaunchesDto.fromJson(Map<String, dynamic> json) {
    return LaunchesDto(
      flightNumber: json['flight_number'],
      missionName: json['mission_name'],
      missionId: List<String>.from(json['mission_id'] ?? []),
      upcoming: json['upcoming'],
      launchYear: json['launch_year'],
      launchDateUnix: json['launch_date_unix'],
      launchDateUtc: json['launch_date_utc'],
      launchDateLocal: json['launch_date_local'],
      isTentative: json['is_tentative'],
      tentativeMaxPrecision: json['tentative_max_precision'],
      tbd: json['tbd'],
      launchWindow: json.getOrElse('launch_window', null),
      rocket: RocketDto.fromJson(json['rocket']),
      ships: List<String>.from(json['ships'] ?? []),
      telemetry: TelemetryDto.fromJson(json['telemetry']),
      launchSite: LaunchSiteDto.fromJson(json['launch_site']),
      launchSuccess: json.getOrElse('launch_success', null),
      launchFailureDetails: json['launch_failure_details'] != null
          ? LaunchFailureDetailsDto.fromJson(json['launch_failure_details'])
          : null,
      links: LinksDto.fromJson(json['links']),
      details: json['details'],
      staticFireDateUtc: json['static_fire_date_utc'],
      staticFireDateUnix: json['static_fire_date_unix'],
      timeline: json['timeline'] != null ? TimelineDto.fromJson(json['timeline']) : null,
      crew: json['crew'],
    );
  }
}

class RocketDto {
  final String rocketId;
  final String rocketName;
  final String rocketType;
  final FirstStageDto firstStage;
  final SecondStageDto secondStage;
  final FairingsDto? fairings;

  RocketDto({
    required this.rocketId,
    required this.rocketName,
    required this.rocketType,
    required this.firstStage,
    required this.secondStage,
    required this.fairings,
  });

  factory RocketDto.fromJson(Map<String, dynamic> json) {
    return RocketDto(
      rocketId: json['rocket_id'],
      rocketName: json['rocket_name'],
      rocketType: json['rocket_type'],
      firstStage: FirstStageDto.fromJson(json['first_stage']),
      secondStage: SecondStageDto.fromJson(json['second_stage']),
      fairings: json['fairings'] != null ? FairingsDto.fromJson(json['fairings']) : null,
    );
  }
}

class FirstStageDto {
  final List<CoreDto> cores;

  FirstStageDto({required this.cores});

  factory FirstStageDto.fromJson(Map<String, dynamic> json) {
    return FirstStageDto(
      cores: (json['cores'] as List).map((e) => CoreDto.fromJson(e)).toList(),
    );
  }
}

class CoreDto {
  final String coreSerial;
  final int flight;
  final dynamic block;
  final bool gridfins;
  final bool legs;
  final bool reused;
  final bool? landSuccess;
  final bool landingIntent;
  final dynamic landingType;
  final dynamic landingVehicle;

  CoreDto({
    required this.coreSerial,
    required this.flight,
    this.block,
    required this.gridfins,
    required this.legs,
    required this.reused,
    this.landSuccess,
    required this.landingIntent,
    this.landingType,
    this.landingVehicle,
  });

  factory CoreDto.fromJson(Map<String, dynamic> json) {
    return CoreDto(
      coreSerial: json['core_serial'],
      flight: json['flight'],
      block: json['block'],
      gridfins: json['gridfins'],
      legs: json['legs'],
      reused: json['reused'],
      landSuccess: json['land_success'],
      landingIntent: json['landing_intent'],
      landingType: json['landing_type'],
      landingVehicle: json['landing_vehicle'],
    );
  }
}

class SecondStageDto {
  final int block;
  final List<PayloadDto> payloads;

  SecondStageDto({required this.block, required this.payloads});

  factory SecondStageDto.fromJson(Map<String, dynamic> json) {
    return SecondStageDto(
      block: json['block'],
      payloads: (json['payloads'] as List)
          .map((e) => PayloadDto.fromJson(e))
          .toList(),
    );
  }
}

class PayloadDto {
  final String payloadId;
  final List<dynamic> noradId;
  final bool reused;
  final List<String> customers;
  final String nationality;
  final String manufacturer;
  final String payloadType;
  final double? payloadMassKg;
  final double? payloadMassLbs;
  final String orbit;
  final OrbitParamsDto orbitParams;

  PayloadDto({
    required this.payloadId,
    required this.noradId,
    required this.reused,
    required this.customers,
    required this.nationality,
    required this.manufacturer,
    required this.payloadType,
    required this.payloadMassKg,
    required this.payloadMassLbs,
    required this.orbit,
    required this.orbitParams,
  });

  factory PayloadDto.fromJson(Map<String, dynamic> json) {
    return PayloadDto(
      payloadId: json['payload_id'],
      noradId: List<dynamic>.from(json['norad_id'] ?? []),
      reused: json['reused'],
      customers: List<String>.from(json['customers']),
      nationality: json['nationality'],
      manufacturer: json['manufacturer'],
      payloadType: json['payload_type'],
      payloadMassKg: json.getOrElse('payload_mass_kg', null)?.toDouble(),
      payloadMassLbs: json.getOrElse('payload_mass_lbs', null)?.toDouble(),
      orbit: json['orbit'],
      orbitParams: OrbitParamsDto.fromJson(json['orbit_params']),
    );
  }
}

class OrbitParamsDto {
  final String referenceSystem;
  final String regime;
  final dynamic longitude;
  final dynamic semiMajorAxisKm;
  final dynamic eccentricity;
  final double? periapsisKm;
  final double? apoapsisKm;
  final double? inclinationDeg;
  final dynamic periodMin;
  final dynamic lifespanYears;
  final dynamic epoch;
  final dynamic meanMotion;
  final dynamic raan;
  final dynamic argOfPericenter;
  final dynamic meanAnomaly;

  OrbitParamsDto({
    required this.referenceSystem,
    required this.regime,
    this.longitude,
    this.semiMajorAxisKm,
    this.eccentricity,
    required this.periapsisKm,
    required this.apoapsisKm,
    required this.inclinationDeg,
    this.periodMin,
    this.lifespanYears,
    this.epoch,
    this.meanMotion,
    this.raan,
    this.argOfPericenter,
    this.meanAnomaly,
  });

  factory OrbitParamsDto.fromJson(Map<String, dynamic> json) {
    return OrbitParamsDto(
      referenceSystem: json['reference_system'],
      regime: json['regime'],
      longitude: json['longitude'],
      semiMajorAxisKm: json['semi_major_axis_km'],
      eccentricity: json['eccentricity'],
      periapsisKm: json.getOrElse('periapsis_km', null)?.toDouble(),
      apoapsisKm: json.getOrElse('apoapsis_km', null)?.toDouble(),
      inclinationDeg: json.getOrElse('inclination_deg', null)?.toDouble(),
      periodMin: json['period_min'],
      lifespanYears: json['lifespan_years'],
      epoch: json['epoch'],
      meanMotion: json['mean_motion'],
      raan: json['raan'],
      argOfPericenter: json['arg_of_pericenter'],
      meanAnomaly: json['mean_anomaly'],
    );
  }
}

class FairingsDto {
  final bool reused;
  final bool recoveryAttempt;
  final bool recovered;
  final dynamic ship;

  FairingsDto({
    required this.reused,
    required this.recoveryAttempt,
    required this.recovered,
    this.ship,
  });

  factory FairingsDto.fromJson(Map<String, dynamic> json) {
    return FairingsDto(
      reused: json['reused'],
      recoveryAttempt: json['recovery_attempt'],
      recovered: json['recovered'],
      ship: json['ship'],
    );
  }
}

class TelemetryDto {
  final dynamic flightClub;

  TelemetryDto({this.flightClub});

  factory TelemetryDto.fromJson(Map<String, dynamic> json) {
    return TelemetryDto(flightClub: json['flight_club']);
  }
}

class LaunchSiteDto {
  final String siteId;
  final String siteName;
  final String siteNameLong;

  LaunchSiteDto({
    required this.siteId,
    required this.siteName,
    required this.siteNameLong,
  });

  factory LaunchSiteDto.fromJson(Map<String, dynamic> json) {
    return LaunchSiteDto(
      siteId: json['site_id'],
      siteName: json['site_name'],
      siteNameLong: json['site_name_long'],
    );
  }
}

class LaunchFailureDetailsDto {
  final int time;
  final dynamic altitude;
  final String reason;

  LaunchFailureDetailsDto({
    required this.time,
    this.altitude,
    required this.reason,
  });

  factory LaunchFailureDetailsDto.fromJson(Map<String, dynamic> json) {
    return LaunchFailureDetailsDto(
      time: json['time'],
      altitude: json['altitude'],
      reason: json['reason'],
    );
  }
}

class LinksDto {
  final String missionPatch;
  final String missionPatchSmall;
  final dynamic redditCampaign;
  final dynamic redditLaunch;
  final dynamic redditRecovery;
  final dynamic redditMedia;
  final dynamic presskit;
  final String? articleLink;
  final String? wikipedia;
  final String? videoLink;
  final String? youtubeId;
  final List<dynamic> flickrImages;

  LinksDto({
    required this.missionPatch,
    required this.missionPatchSmall,
    this.redditCampaign,
    this.redditLaunch,
    this.redditRecovery,
    this.redditMedia,
    this.presskit,
    required this.articleLink,
    required this.wikipedia,
    required this.videoLink,
    required this.youtubeId,
    required this.flickrImages,
  });

  factory LinksDto.fromJson(Map<String, dynamic> json) {
    return LinksDto(
      missionPatch: json['mission_patch'],
      missionPatchSmall: json['mission_patch_small'],
      redditCampaign: json['reddit_campaign'],
      redditLaunch: json['reddit_launch'],
      redditRecovery: json['reddit_recovery'],
      redditMedia: json['reddit_media'],
      presskit: json['presskit'],
      articleLink: json.getOrElse('article_link', null),
      wikipedia: json['wikipedia'],
      videoLink: json['video_link'],
      youtubeId: json['youtube_id'],
      flickrImages: List<dynamic>.from(json['flickr_images'] ?? []),
    );
  }
}

class TimelineDto {
  final int webcastLiftoff;

  TimelineDto({required this.webcastLiftoff});

  factory TimelineDto.fromJson(Map<String, dynamic> json) {
    return TimelineDto(webcastLiftoff: json['webcast_liftoff']);
  }
}
