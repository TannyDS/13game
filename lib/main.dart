import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_app_flutter/card_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: CardPage(),
    );
  }
}
