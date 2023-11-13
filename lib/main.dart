import 'package:flutter/material.dart';
import 'package:google_app/responsive/mobile_screen_layout.dart';
import 'package:google_app/responsive/responsive_layout_screen.dart';
import 'package:google_app/responsive/web_screen_layout.dart';
import 'package:google_app/screens/search_screen.dart';

import 'colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const ResponsiveLayoutScreen(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      ),
    );
  }
}
