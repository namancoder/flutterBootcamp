import 'package:flutter/material.dart';
import 'package:music_app/config.dart';
import 'package:music_app/tracks.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';



void main() async {
  await Hive.initFlutter();
  box = await Hive.openBox('easyTheme');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      print("CHANGES");
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentTheme(),
      home: Tracks(),
    );
  }
}
