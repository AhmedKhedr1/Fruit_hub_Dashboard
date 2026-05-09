import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderStatusBadge extends StatelessWidget {
  final String status;

  const OrderStatusBadge({
    super.key,
    required this.status,
  });

  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case 'accepted':
        return Colors.blue;

      case 'delivered':
        return Colors.green;

      case 'cancelled':
        return Colors.red;

      case 'pending':
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: _getStatusColor().withOpacity(.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          color: _getStatusColor(),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}