// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

void BuildErrorBar(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
}
