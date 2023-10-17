import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:just_play_demo/data/global_blocs/auth_cubit.dart';
import 'package:just_play_demo/injectable.dart';

import 'presentation/routes/navigation_service.dart';

class JustPlayApp extends StatelessWidget {
  const JustPlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<AuthCubit>()),
        // BlocProvider.value(value: getIt<LocalizationCubit>()),
        // BlocProvider.value(value: getIt<ThemeCubit>()),
        // BlocProvider.value(value: getIt<LocalDataCubit>()),
        // BlocProvider.value(value: getIt<DiceRollCubit>()),
      ],
      child: const _JustPlayConsumer(),
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
    // final theme = context.read<ThemeCubit>().theme;
    // final locale = context.read<LocalizationCubit>().locale;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp.router(
      title: 'Just Play',
      localizationsDelegates: const [
        //AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      //supportedLocales: AppLocalizations.supportedLocales,
      //locale: locale,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );

    // return MultiBlocListener(
    //   listeners: [
    //     // BlocListener<ThemeCubit, ThemeData>(
    //     //   listener: (ctx, state) {
    //     //     setState(() {});
    //     //   },
    //     // ),
    //     // BlocListener<LocalizationCubit, Locale>(
    //     //   listener: (ctx, state) {
    //     //     setState(() {});
    //     //   },
    //     // ),
    //   ],
    //   child: ,
    // );
  }
}
