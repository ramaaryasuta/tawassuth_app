import 'package:flutter/material.dart';

import '../features/prayer_time/presentation/widgets/hero_prayer_time.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(children: [const HeroPrayerTime()]));
  }
}
