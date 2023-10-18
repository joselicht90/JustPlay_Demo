import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_play_demo/data/models/city.dart';
import 'package:just_play_demo/extensions/context_extensions.dart';
import 'package:just_play_demo/presentation/pages/location/cubit/location_page_cubit.dart';
import 'package:just_play_demo/presentation/shared/inputs/jp_dropdown.dart';

class CityInput extends StatelessWidget {
  const CityInput({super.key});

  List<DropdownMenuItem<int>> _getItems(List<City> items) {
    return items
        .map((c) => DropdownMenuItem<int>(
              value: c.id,
              child: Text(c.name),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationPageCubit, LocationPageState>(
      builder: (context, state) {
        final cubit = context.read<LocationPageCubit>();
        if (state is FetchingCities) {
          return LinearProgressIndicator(
            color: context.theme.colorScheme.primary,
          );
        }
        if (state is CitiesFetched) {
          return JPDropdownField<int>(
            name: 'city',
            label: 'City',
            hintText: 'Select your city',
            onChanged: (value) {
              cubit.selectCity(value!);
            },
            items: _getItems(state.cities),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
