import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newton_tech_interview_quiz/domain/value_objects/spacex_flight_folder.dart';
import 'package:newton_tech_interview_quiz/presentation/all_launches/all_launches_viewmodel.dart';
import 'package:newton_tech_interview_quiz/presentation/all_launches/flight_info_tile.dart';

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
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final AsyncValue<SpaceXFlightFolder> spaceXFlightFolder =
              ref.watch(spaceXFlightFolderProvider);
          final spaceXFlightSortNotifier =
              ref.watch(spaceXFlightSortNotifierProvider.notifier);
          final spaceXFlightSort = ref.watch(spaceXFlightSortNotifierProvider);
          return Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          spaceXFlightSortNotifier.toggleSort();
                        },
                        child: Row(
                          spacing: 4,
                          children: [
                            Icon(
                              Icons.sort,
                              color: Color(0xFFD28C7A),
                            ),
                            Text(
                              spaceXFlightSort == SpaceXFlightSort.descending
                                  ? 'Flight number: oldest'
                                  : 'Flight number: newest',
                              style: TextStyle(
                                color: Color(0xFFD28C7A),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () =>
                        ref.refresh(spaceXFlightFolderProvider.future),
                    child: switch (spaceXFlightFolder) {
                      AsyncData(:final value) => Builder(builder: (context) {
                          final sortedFlights = value.flights;

                          sortedFlights.sort((a, b) {
                            if (spaceXFlightSort ==
                                SpaceXFlightSort.descending) {
                              return a.flightNumber.compareTo(b.flightNumber);
                            } else {
                              return b.flightNumber.compareTo(a.flightNumber);
                            }
                          });

                          return ListView.builder(
                            itemCount: sortedFlights.length,
                            itemBuilder: (context, index) {
                              final flight = sortedFlights[index];
                              return FlightInfoTile(flight: flight);
                            },
                          );
                        }),
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
