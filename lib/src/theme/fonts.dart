import 'package:bdt_hakaton/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

final theme = ThemeData(
  cardTheme: const CardTheme(),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        fontFamily: 'Cuyabra',
        fontSize: 64,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        color: AppColors.black),
    titleMedium: TextStyle(
        fontFamily: 'Cuyabra',
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: AppColors.black),
    bodyLarge: TextStyle(
        fontFamily: 'Cuyabra',
        fontSize: 22,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: AppColors.black),
    bodyMedium: TextStyle(
        fontFamily: 'Cuyabra',
        fontSize: 18,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        color: AppColors.black),
    bodySmall: TextStyle(
        fontFamily: 'Cuyabra',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.0,
        color: AppColors.white),
    displaySmall: TextStyle(
        fontFamily: 'Cuyabra',
        fontSize: 18,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        color: AppColors.white),
    displayMedium: TextStyle(
        fontFamily: 'Cuyabra',
        fontSize: 22,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: AppColors.grey),
  ),
);
