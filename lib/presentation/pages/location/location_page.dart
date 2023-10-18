import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:just_play_demo/extensions/context_extensions.dart';
import 'package:just_play_demo/injectable.dart';
import 'package:just_play_demo/presentation/pages/location/cubit/location_page_cubit.dart';
import 'package:just_play_demo/presentation/pages/location/widgets/city_input.dart';
import 'package:just_play_demo/presentation/pages/location/widgets/country_input.dart';
import 'package:just_play_demo/presentation/pages/location/widgets/state_input.dart';
import 'package:just_play_demo/presentation/routes/routes.dart';
import 'package:just_play_demo/presentation/shared/buttons/jp_logout_button.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<LocationPageCubit>(),
      child: const LocationPageConsumer(),
    );
  }
}

class LocationPageConsumer extends StatefulWidget {
  const LocationPageConsumer({super.key});

  @override
  State<LocationPageConsumer> createState() => _LocationPageConsumerState();
}

class _LocationPageConsumerState extends State<LocationPageConsumer> {
  @override
  void initState() {
    context.read<LocationPageCubit>().fetchCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationPageCubit, LocationPageState>(
      listener: (context, state) {
        if (state is LocationPageError) {
          context.showError(error: state.error);
        }

        if (state is SearchingGames) {
          context.go(AppRoutes.home, extra: state.city);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: const [JPLogoutButton()],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/current_location.svg',
                          height: 200,
                        ),
                        const SizedBox(height: 20),
                        const CountryInput(),
                        const SizedBox(height: 20),
                        const StateInput(),
                        const SizedBox(height: 20),
                        const CityInput(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        context.read<LocationPageCubit>().searchGames();
                      },
                      child: const Text('Search Games!'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
