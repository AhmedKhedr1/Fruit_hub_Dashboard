import 'package:flutter/widgets.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/order_status_badge.dart';

class OrderUserInfo extends StatelessWidget {
  final OrderEntity order;

  const OrderUserInfo({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                order.shippingAddressEntity.name ?? '',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                order.shippingAddressEntity.email ?? '',
              ),

              Text(
                order.shippingAddressEntity.phoneNum ?? '',
              ),

              Text('${order.shippingAddressEntity.city },${order.shippingAddressEntity.address}, ${order.shippingAddressEntity.floor}'),
            ],
          ),
        ),

        OrderStatusBadge(
          status: order.status.name,
        ),
      ],
    );
  }
}