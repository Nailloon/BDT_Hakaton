import 'dart:async';
import 'dart:developer';
import 'package:bdt_hakaton/src/app.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const BestWebsitesApp());
  }, (error, stack) async {
    log(error.toString(), name: 'App Error', stackTrace: stack);
  });
}