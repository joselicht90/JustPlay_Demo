import 'package:flutter/material.dart';
import 'package:just_play_demo/injectable.dart';

Future<void> appInit(Widget Function() initApp) async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  await getIt.allReady();

  Future.delayed(const Duration(seconds: 1));

  runApp(initApp());
}

abstract class AppConfigs {
  static const String apiKey =
      'NXZ2UEJjQzlYbHBMWTNOU0E1ZlROVHNiVm5lSEQ0RzgxeUlTOFRqaQ==';
  static const String apiKeyHeader = 'X-CSCAPI-KEY';
  static const String baseUrl = 'https://api.countrystatecity.in/v1';
}
