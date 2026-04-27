import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/Text_Styless.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.current.orders, style: TextStyless.bold23),centerTitle: true,),
      body: OrdersViewBody(),
    );
  }
}
