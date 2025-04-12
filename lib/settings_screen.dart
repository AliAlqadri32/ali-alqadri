import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;

  void _playAthan() async {
    final player = AudioPlayer();
    await player.play(AssetSource('audio/athan.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('الإشعارات'),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            SwitchListTile(
              title: Text('تشغيل الأذان'),
              value: notificationsEnabled,
              onChanged: (val) {
                setState(() {
                  notificationsEnabled = val;
                });
                if (val) {
                  _playAthan();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
