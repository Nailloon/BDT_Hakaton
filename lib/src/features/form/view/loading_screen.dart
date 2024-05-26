import 'package:bdt_hakaton/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(backgroundColor: AppColors.purple, valueColor: AlwaysStoppedAnimation(AppColors.brightOrange), );
  }
}