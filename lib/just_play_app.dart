import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:just_play_demo/data/global_blocs/auth_cubit.dart';
import 'package:just_play_demo/injectable.dart';
import 'package:just_play_demo/presentation/themes/app_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'presentation/routes/navigation_service.dart';

// Here we configure the app
class JustPlayApp extends StatelessWidget {
  const JustPlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsive sizer is an awesome package for making your app responsive
    // https://pub.dev/packages/responsive_sizer
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: getIt<AuthCubit>()),
          ],
          child: const _JustPlayConsumer(),
        );
      },
    );
  }
}

class _JustPlayConsumer extends StatefulWidget {
  const _JustPlayConsumer();

  @override
  State<_JustPlayConsumer> createState() => _JustPlayConsumerState();
}

class _JustPlayConsumerState extends State<_JustPlayConsumer> {
  final router = NavigationService.router;

  @override
  Widget build(BuildContext context) {
    //For easyness of development we lock the app to portrait mode
    //In case we want to make the app more apealing for tablets we can disable
    //and develop with landsace mode in mind
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp.router(
      title: 'Just Play',
      theme: AppTheme.lightTheme,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
