import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void toggleTheme() {
    setState(() {
      _themeMode =
      _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'أوقات الصلاة',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.indigo,
        cardColor: Colors.grey[100],
        fontFamily: 'Cairo',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.tealAccent,
        cardColor: Colors.grey[900],
        fontFamily: 'Cairo',
      ),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: PrayerTimesScreen(toggleTheme: toggleTheme, themeMode: _themeMode),
    );
  }
}

class PrayerTimesScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final ThemeMode themeMode;

  const PrayerTimesScreen({
    required this.toggleTheme,
    required this.themeMode,
  });

  final List<Map<String, String>> prayerTimes = const [
    {'name': 'الفجر', 'time': '04:30 ص'},
    {'name': 'الظهر', 'time': '12:15 م'},
    {'name': 'العصر', 'time': '03:45 م'},
    {'name': 'المغرب', 'time': '06:20 م'},
    {'name': 'العشاء', 'time': '07:45 م'},
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('أوقات الصلاة'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(themeMode == ThemeMode.dark
                  ? Icons.wb_sunny
                  : Icons.nightlight_round),
              onPressed: toggleTheme,
            ),
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert),
              onSelected: (value) {
                // هنا نقدر ننتقل لصفحات أخرى أو نعرض Dialogs
                if (value == 'settings') {
                  print('فتح الإعدادات');
                } else if (value == 'city') {
                  print('اختيار المدينة');
                } else if (value == 'notifications') {
                  print('الإشعارات');
                } else if (value == 'athan') {
                  print('تشغيل الأذان');
                } else if (value == 'about') {
                  showAboutDialog(
                    context: context,
                    applicationName: 'تطبيق أوقات الصلاة',
                    applicationVersion: '1.0.0',
                    children: [Text('تم التطوير بواسطة alialqadri ❤️')],
                  );
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(value: 'settings', child: Text('الإعدادات')),
                PopupMenuItem(value: 'city', child: Text('اختيار المدينة')),
                PopupMenuItem(value: 'notifications', child: Text('الإشعارات')),
                PopupMenuItem(value: 'athan', child: Text('تشغيل الأذان')),
                PopupMenuItem(value: 'about', child: Text('حول التطبيق')),
              ],
            ),
          ],

        ),
        body: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: prayerTimes.length,
          itemBuilder: (context, index) {
            final prayer = prayerTimes[index];
            return PrayerCard(name: prayer['name']!, time: prayer['time']!);
          },
        ),
      ),
    );
  }
}

class PrayerCard extends StatelessWidget {
  final String name;
  final String time;

  const PrayerCard({required this.name, required this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Theme.of(context).primaryColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        title: Text(
          name,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          time,
          style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
