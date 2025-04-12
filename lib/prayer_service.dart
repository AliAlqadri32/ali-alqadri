import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PrayerTimes {
  final String fajr;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  PrayerTimes({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  factory PrayerTimes.fromJson(Map<String, dynamic> json) {
    final timings = json['data']['timings'];
    return PrayerTimes(
      fajr: timings['Fajr'],
      dhuhr: timings['Dhuhr'],
      asr: timings['Asr'],
      maghrib: timings['Maghrib'],
      isha: timings['Isha'],
    );
  }
}

Future<PrayerTimes> fetchPrayerTimes() async {
  final url = Uri.parse('https://api.aladhan.com/v1/timingsByCity?city=Makkah&country=Saudi%20Arabia&method=4');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return PrayerTimes.fromJson(json.decode(response.body));
  } else {
    throw Exception('فشل في تحميل أوقات الصلاة');
  }
}
