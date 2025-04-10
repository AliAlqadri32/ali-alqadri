import 'package:flutter/material.dart';

class PrayerTimesScreen extends StatelessWidget {
  const PrayerTimesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أوقات الصلاة'),
      ),
      body: const Center(
        child: Text(
          'هنا سيتم عرض أوقات الصلاة قريبًا',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
