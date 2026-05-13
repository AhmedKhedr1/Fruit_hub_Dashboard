import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruit_hub_dashboard/core/utils/App_colors.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/manager/update_order/update_order_cubit.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';

class OrderActions extends StatelessWidget {
  const OrderActions({super.key, required this.order});
  final OrderEntity order;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                orderID: order.orderID,
                status: OrderStatusEnum.accepted,
              );
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
            ),

            child: Text(
              S.current.accept,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                orderID: order.orderID,
                status: OrderStatusEnum.cancelled,
              );
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.withOpacity(0.9),
            ),

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
