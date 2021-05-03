import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/language/language_cubit.dart';

class LanguageSelection extends StatelessWidget {
  const LanguageSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageCubit = context.watch<LanguageCubit>();
    final locale = languageCubit.state;
    int index = 0;

    if (locale.languageCode == 'az') {
      index = 1;
    }

    return Column(
      children: [
        RadioListTile(
          value: 0,
          title: Text('English'),
          groupValue: index,
          onChanged: (index) {
            languageCubit.changeLocale(Locale('en', 'US'));
          },
        ),
        RadioListTile(
          value: 1,
          title: Text('Azerbaijan'),
          groupValue: index,
          onChanged: (index) {
            languageCubit.changeLocale(Locale('az', 'AZ'));
          },
        ),
      ],
    );
  }
}
