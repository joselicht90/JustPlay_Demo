import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_play_demo/data/models/country.dart';
import 'package:just_play_demo/extensions/context_extensions.dart';
import 'package:just_play_demo/presentation/pages/location/cubit/location_page_cubit.dart';
import 'package:just_play_demo/presentation/shared/inputs/jp_dropdown.dart';

class CountryInput extends StatelessWidget {
  const CountryInput({super.key});

  List<DropdownMenuItem<String>> _getItems(List<Country> items) {
    return items
        .map((c) => DropdownMenuItem<String>(
              value: c.iso2,
              child: Text(c.name),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationPageCubit, LocationPageState>(
      builder: (context, state) {
        final cubit = context.read<LocationPageCubit>();
        if (state is FetchingCountries) {
          return LinearProgressIndicator(
            color: context.theme.colorScheme.primary,
          );
        }
        if (state is CountriesFetched) {
          return JPDropdownField<String>(
            name: 'countries',
            label: 'Country',
            hintText: 'Select your country',
            onChanged: (value) {
              cubit.fetchStates(value!);
            },
            items: _getItems(state.countries),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
