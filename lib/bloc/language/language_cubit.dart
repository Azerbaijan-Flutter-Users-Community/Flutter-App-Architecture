import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../contractors/impl_preferences_service.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit(this.preferencesService) : super(Locale('en', 'US')) {
    final locale = preferencesService.locale;
    emit(locale ?? Locale('en', 'US'));
  }

  final ImplPreferencesService preferencesService;

  void changeLocale(Locale locale) async {
    if (state == locale) {
      return;
    }

    await preferencesService.changeLocale(locale);
    emit(locale);
  }
}
