import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/theme/theme_cubit.dart';

class ThemeSelection extends StatelessWidget {
  const ThemeSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    final themeMode = themeCubit.state;

    return Column(
      children: [
        RadioListTile(
          value: 0,
          title: Text('System default'),
          groupValue: themeMode.index,
          onChanged: (index) {
            themeCubit.changeTheme(ThemeMode.system);
          },
        ),
        RadioListTile(
          value: 1,
          title: Text('Light'),
          groupValue: themeMode.index,
          onChanged: (index) {
            themeCubit.changeTheme(ThemeMode.light);
          },
        ),
        RadioListTile(
          value: 2,
          title: Text('Dark'),
          groupValue: themeMode.index,
          onChanged: (index) {
            themeCubit.changeTheme(ThemeMode.dark);
          },
        ),
      ],
    );
  }
}
