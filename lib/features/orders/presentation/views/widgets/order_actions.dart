import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/App_colors.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';

class OrderActions extends StatelessWidget {
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const OrderActions({
    super.key,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onAccept,

            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),

            child: Text(
              S.current.accept,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: onReject,

            style: ElevatedButton.styleFrom(backgroundColor: Colors.red.withOpacity(0.9)),

            child: Text(
              S.current.reject,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
