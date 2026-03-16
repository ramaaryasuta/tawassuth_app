import 'package:flutter/material.dart';

import '../../../domain/entity/prayer_time.dart';

class PrayerTimeCard extends StatefulWidget {
  const PrayerTimeCard({super.key, required this.prayerTimeData});

  final PrayerTimeData prayerTimeData;

  @override
  State<PrayerTimeCard> createState() => _PrayerTimeCardState();
}

class _PrayerTimeCardState extends State<PrayerTimeCard> {
  Times _prayTimeToday = const Times(
    fajr: '',
    dhuhr: '',
    asr: '',
    maghrib: '',
    isha: '',
  );

  void _checkPrayerTimeToday() {
    final dateNow =
        "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}";

    final today = widget.prayerTimeData.prayerTimes.firstWhere(
      (element) => element.date == dateNow,
    );

    _prayTimeToday = today.times;
  }

  @override
  void initState() {
    super.initState();
    _checkPrayerTimeToday();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildPrayerTime(title: 'Subuh', time: _prayTimeToday.fajr),
        _buildPrayerTime(title: 'Dzuhur', time: _prayTimeToday.dhuhr),
        _buildPrayerTime(title: 'Ashar', time: _prayTimeToday.asr),
        _buildPrayerTime(title: 'Maghrib', time: _prayTimeToday.maghrib),
        _buildPrayerTime(title: 'Isya', time: _prayTimeToday.isha),
      ],
    );
  }

  Column _buildPrayerTime({required String title, required String time}) {
    return Column(
      children: [
        Text(title),
        Text(time, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
