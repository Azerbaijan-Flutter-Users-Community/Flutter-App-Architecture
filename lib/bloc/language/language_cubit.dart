import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/preferences_service.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit(Locale initialLocale) : super(initialLocale) {
    final locale = PreferencesService.instance.locale;
    emit(locale ?? initialLocale);
  }

  void changeLocale(Locale locale) async {
    if (state == locale) {
      return;
    }

    await PreferencesService.instance.changeLocale(locale);
    emit(locale);
  }
}
