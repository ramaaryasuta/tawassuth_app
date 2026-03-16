import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/prayer_time_cubit.dart';
import '../cubits/prayer_time_state.dart';
import 'components/prayer_time_card.dart';

class HeroPrayerTime extends StatefulWidget {
  const HeroPrayerTime({super.key});

  @override
  State<HeroPrayerTime> createState() => _HeroPrayerTimeState();
}

class _HeroPrayerTimeState extends State<HeroPrayerTime> {
  @override
  void initState() {
    super.initState();
    context.read<PrayerTimeCubit>().getPrayerTime(1.6034, 103.5835);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Colors.cyan),
      child: BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
        builder: (context, state) {
          if (state is PrayerTimeLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is PrayerTimeLoaded) {
            final data = state.prayerTimeData;

            return Column(
              children: [
                Expanded(child: Container()),
                PrayerTimeCard(prayerTimeData: data),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
