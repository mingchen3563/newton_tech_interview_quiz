import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:newton_tech_interview_quiz/data/dtos/launches_dto.dart';

void main() {
  final String dataJsonString = '''{
        "flight_number": 110,
        "mission_name": "CRS-21", 
        "mission_id": ["EE86F74"],
        "launch_year": "2020",
        "launch_date_unix": 1607271420,
        "launch_date_utc": "2020-12-06T16:17:00.000Z",
        "launch_date_local": "2020-12-06T11:17:00-05:00",
        "is_tentative": false,
        "tentative_max_precision": "hour",
        "tbd": false,
        "launch_window": null,
        "rocket": {
          "rocket_id": "falcon9",
          "rocket_name": "Falcon 9",
          "rocket_type": "FT",
          "first_stage": {
            "cores": [
              {
                "core_serial": "B1058",
                "flight": 4,
                "block": 5,
                "gridfins": true,
                "legs": true,
                "reused": true,
                "land_success": null,
                "landing_intent": true,
                "landing_type": "ASDS",
                "landing_vehicle": null
              }
            ]
          },
          "second_stage": {
            "block": 5,
            "payloads": [
              {
                "payload_id": "CRS-21",
                "norad_id": [],
                "cap_serial": "C208", 
                "reused": true,
                "customers": ["NASA (CRS)"],
                "nationality": "United States",
                "manufacturer": "SpaceX",
                "payload_type": "Dragon 2.0",
                "payload_mass_kg": null,
                "payload_mass_lbs": null,
                "orbit": "ISS",
                "orbit_params": {
                  "reference_system": "geocentric",
                  "regime": "low-earth",
                  "longitude": null,
                  "semi_major_axis_km": null,
                  "eccentricity": null,
                  "periapsis_km": null,
                  "apoapsis_km": null,
                  "inclination_deg": null,
                  "period_min": null,
                  "lifespan_years": null,
                  "epoch": null,
                  "mean_motion": null,
                  "raan": null,
                  "arg_of_pericenter": null,
                  "mean_anomaly": null
                },
                "mass_returned_kg": null,
                "mass_returned_lbs": null,
                "flight_time_sec": null,
                "cargo_manifest": null
              }
            ]
          },
          "fairings": null
        },
        "ships": [],
        "telemetry": {
          "flight_club": null
        },
        "launch_site": {
          "site_id": "ksc_lc_39a",
          "site_name": "KSC LC 39A",
          "site_name_long": "Kennedy Space Center Historic Launch Complex 39A"
        },
        "launch_success": null,
        "links": {
          "mission_patch": "https://imgur.com/E7fjUBD.png",
          "mission_patch_small": "https://imgur.com/jHNFSY6.png",
          "reddit_campaign": "https://www.reddit.com/r/spacex/comments/jw8bfe/crs21_launch_campaign_thread/",
          "reddit_launch": null,
          "reddit_recovery": null,
          "reddit_media": null,
          "presskit": null,
          "article_link": null,
          "wikipedia": null,
          "video_link": null,
          "youtube_id": null,
          "flickr_images": []
        },
        "details": "SpaceX's 21st ISS resupply mission on behalf of NASA and the first under the CRS-2 contract, this mission brings essential supplies to the International Space Station using the cargo variant of SpaceX's Dragon 2 spacecraft. The external payload for this mission is the Nanoracks Bishop Airlock. Falcon 9 and Dragon launch from LC-39A, Kennedy Space Center and the booster is expected to land on an ASDS. The mission will be complete with return and recovery of the Dragon capsule and down cargo.",
        "upcoming": true,
        "static_fire_date_utc": null,
        "static_fire_date_unix": null,
        "timeline": null,
        "crew": null
      }
''';
  test('launches dto ...', () async {
    final data = jsonDecode(dataJsonString);
    final launchesDto = LaunchesDto.fromJson(data);
    expect(launchesDto.flightNumber, 110);
    expect(launchesDto.missionName, 'CRS-21');
  });
}
