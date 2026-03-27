import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/localization/App_languages.dart';
import 'package:fruit_hub_dashboard/core/localization/cubit/language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageState(AppLanguages.getArabicLocale()));

  void changeLanguage(Locale locale) {
    emit(LanguageState(locale));
  }
}
