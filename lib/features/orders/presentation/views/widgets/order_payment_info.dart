import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_entity.dart';

class OrderPaymentInfo extends StatelessWidget {
  final OrderEntity order;

  const OrderPaymentInfo({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Payment: ${order.paymentMethod}',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),

        Text(
          'Total: \$${order.totalPrice}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}