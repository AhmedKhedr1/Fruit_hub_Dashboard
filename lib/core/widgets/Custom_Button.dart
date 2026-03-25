import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/App_colors.dart';
import 'package:fruit_hub_dashboard/core/utils/Text_Styless.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onpressed});
  final String title;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        onPressed: onpressed,
        child: Text(
          title,
          style: TextStyless.bold16.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
