import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newton_tech_interview_quiz/domain/value_objects/spacex_flight_folder.dart';
import 'package:newton_tech_interview_quiz/presentation/all_launches/provider.dart';

class AllLaunchesPage extends StatelessWidget {
  const AllLaunchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('All Launches'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final AsyncValue<SpaceXFlightFolder> spaceXFlightFolder =
              ref.watch(spaceXFlightFolderProvider);
          return Center(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(Icons.sort),
                          Text('Filter'),
                        ],
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () =>
                        ref.refresh(spaceXFlightFolderProvider.future),
                    child: switch (spaceXFlightFolder) {
                      AsyncData(:final value) => ListView.builder(
                          itemCount: value.flights.length,
                          itemBuilder: (context, index) {
                            final flight = value.flights[index];
                            return ListTile(
                              isThreeLine: true,
                              title: Text(
                                flight.flightNumber,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    flight.missionName,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    flight.launchDate.toLocal().toString(),
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                              trailing: Image.network(
                                flight.iconPath ?? '',
                                width: 100,
                                height: 100,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.error);
                                },
                              ),
                            );
                          },
                        ),
                      AsyncError(:final error) => Text(error.toString()),
                      _ => const Center(child: CircularProgressIndicator()),
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
