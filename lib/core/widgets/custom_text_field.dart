import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/Text_Styless.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.keyboardType,
    required this.hint,
    required this.maxLines,
  });
  final TextInputType keyboardType;
  final String hint;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return validatormessage;
      //   }
      //   return null;
      // },
      // obscureText: obscureText,
      // onSaved: onSaved,
      maxLines: maxLines,
      style: TextStyless.semiBold16,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),

        filled: true,
        fillColor: Color(0xffF9FAFA),
        hintText: hint,
        hintStyle: TextStyless.semiBold16.copyWith(color: Colors.black),
        border: BuildBorder(),
        enabledBorder: BuildBorder(),
        focusedBorder: BuildBorder(),
      ),
    );
  }

  OutlineInputBorder BuildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 1, color: Color(0xffE6E9EA)),
    );
  }
}
