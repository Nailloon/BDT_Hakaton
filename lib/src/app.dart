import 'package:bdt_hakaton/src/features/home_page/view/home_page.dart';
import 'package:bdt_hakaton/src/theme/fonts.dart';
import 'package:flutter/material.dart';

class BestWebsitesApp extends StatelessWidget {
  const BestWebsitesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}