import 'package:fixscore/constants/color.dart';
import 'package:fixscore/constants/text.dart';
import 'package:fixscore/page/anasayfa_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      title: 'FixScore',
      home: AnaSayfa(),
    );
  }
}
