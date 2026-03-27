import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/localization/App_languages.dart';
import 'package:fruit_hub_dashboard/core/localization/cubit/language_cubit.dart';

class LanguageButton extends StatefulWidget {
  const LanguageButton({super.key});

  @override
  State<LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  @override
  Widget build(BuildContext context) {
    final currentLang = context.select(
      (LanguageCubit cubit) => cubit.state.locale,
    );
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildButton(
            context,
            title: "English",
            isSelected: currentLang == AppLanguages.getEnglishLocale(),
            onTap: () {
              context.read<LanguageCubit>().changeLanguage(
                AppLanguages.getEnglishLocale(),
              );
            },
          ),
          _buildButton(
            context,
            title: "العربية",
            isSelected: currentLang == AppLanguages.getArabicLocale(),
            onTap: () {
              context.read<LanguageCubit>().changeLanguage(
                AppLanguages.getArabicLocale(),
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildButton(
  BuildContext context, {
  required String title,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
