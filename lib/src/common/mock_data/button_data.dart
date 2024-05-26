import 'package:bdt_hakaton/src/features/form/view/form_screen.dart';
import 'package:bdt_hakaton/src/features/form/view/loading_screen.dart';
import 'package:flutter/material.dart';

final List<Map<String, Widget>> buttonsData = [
  {
    "Проверить сайт на индексацию": FormScreen(),
  },
  {"Проверить список сайтов на индексируемость": LoadingScreen()},
];
