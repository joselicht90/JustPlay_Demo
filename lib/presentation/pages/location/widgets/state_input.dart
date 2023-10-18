import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_play_demo/data/models/state.dart';
import 'package:just_play_demo/extensions/context_extensions.dart';
import 'package:just_play_demo/presentation/pages/location/cubit/location_page_cubit.dart';
import 'package:just_play_demo/presentation/shared/inputs/jp_dropdown.dart';

class StateInput extends StatelessWidget {
  const StateInput({super.key});

  List<DropdownMenuItem<String>> _getItems(List<CountryState> items) {
    return items
        .map((s) => DropdownMenuItem<String>(
              value: s.iso2,
              child: Text(s.name),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationPageCubit, LocationPageState>(
      builder: (context, state) {
        final cubit = context.read<LocationPageCubit>();
        if (state is FetchingStates) {
          return LinearProgressIndicator(
            color: context.theme.colorScheme.primary,
          );
        }
        if (state is StatesFetched) {
          return JPDropdownField<String>(
            name: 'state',
            label: 'State',
            hintText: 'Select your state',
            onChanged: (value) {
              cubit.fetchCities(value!);
            },
            items: _getItems(state.states),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
