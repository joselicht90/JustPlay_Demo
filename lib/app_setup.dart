import 'package:flutter/material.dart';
import 'package:just_play_demo/injectable.dart';

Future<void> appInit(Widget Function() initApp) async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  await getIt.allReady();

  Future.delayed(const Duration(seconds: 1));

  runApp(initApp());
}
