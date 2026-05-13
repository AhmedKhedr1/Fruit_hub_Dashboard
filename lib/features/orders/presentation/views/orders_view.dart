import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruit_hub_dashboard/core/utils/Text_Styless.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/repos/order_repo.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/manager/fetch_orders/fetch_orders_cubit.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/manager/update_order/update_order_cubit.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/orders_view_body_bloc_builder.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/update_order_builder.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchOrdersCubit(getIt.get<OrderRepo>()),
        ),
        BlocProvider(
          create: (context) => UpdateOrderCubit(getIt.get<OrderRepo>()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.current.orders, style: TextStyless.bold23),
          centerTitle: true,
        ),
        body: UpdateOrderBuilder(child: OrdersViewBodyBlocBuilder()),
      ),
    );
  }
}
