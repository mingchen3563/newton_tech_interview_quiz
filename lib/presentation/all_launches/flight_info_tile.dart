import 'package:flutter/material.dart';
import 'package:newton_tech_interview_quiz/domain/value_objects/spacex_flight.dart';

class FlightInfoTile extends StatelessWidget {
  const FlightInfoTile({
    super.key,
    required this.flight,
  });

  final SpaceXFlight flight;

  @override
  Widget build(BuildContext context) {
    final launchDate = flight.launchDate;
    final isoStirng = launchDate.toIso8601String();

    // dd/MM/yyyy hh:mm:ss
    final isoDate = isoStirng.substring(0, 10).split('-');
    final launchDayText = '${isoDate[2]}/${isoDate[1]}/${isoDate[0]}';
    // hh:mm:ss
    final isoTime = isoStirng.substring(11, 19);
    final launchDateText = '$launchDayText $isoTime';
    return ListTile(
      isThreeLine: true,
      title: Text(
        'Flight ${flight.flightNumber}',
        // style: Theme.of(context).textTheme.bodySmall,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            flight.missionName,
            // style:
            //     Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            launchDateText,
            // style:
            //     Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      trailing: Image.network(
        flight.iconPath ?? '',
        width: 100,
        height: 100,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return SizedBox(
            width: 100,
            height: 100,
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
