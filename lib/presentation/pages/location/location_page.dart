import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:just_play_demo/injectable.dart';
import 'package:just_play_demo/presentation/pages/location/cubit/location_page_cubit.dart';

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
    return Scaffold(
      body: BlocConsumer<LocationPageCubit, LocationPageState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Center(
            child: FormBuilderDropdown(
              name: 'Countries',
              items: state is CountriesFetched
                  ? state.countries
                      .map((c) => DropdownMenuItem(
                            child: Text(c.name),
                            value: c.id,
                          ))
                      .toList()
                  : [],
            ),
          );
        },
      ),
    );
  }
}
