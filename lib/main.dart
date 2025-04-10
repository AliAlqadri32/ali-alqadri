import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'أوقات الصلاة',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Arial',
      ),
      home: PrayerTimesScreen(),
    );
  }
}

class PrayerTimesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('أوقات الصلاة'),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFF4F1F8),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20),
        children: [
          prayerCard('الفجر', 'ص 04:30'),
          prayerCard('الظهر', 'م 12:15'),
          prayerCard('العصر', 'م 03:45'),
          prayerCard('المغرب', 'م 06:20'),
          prayerCard('العشاء', 'م 07:45'),
        ],
      ),
    );
  }
}

Widget prayerCard(String title, String time) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 5,
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      title: Text(
        title,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        textAlign: TextAlign.right,
      ),
      trailing: Text(
        time,
        style: TextStyle(fontSize: 20, color: Colors.indigo),
      ),
    ),
  );
}
