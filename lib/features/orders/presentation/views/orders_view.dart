import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/helper/build_error_bar.dart';
import 'package:fruit_hub_dashboard/core/helper/get_order_dummy_data.dart';
import 'package:fruit_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruit_hub_dashboard/core/utils/Text_Styless.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/repos/order_repo.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/manager/fetch_orders/fetch_orders_cubit.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchOrdersCubit(getIt.get<OrderRepo>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.current.orders, style: TextStyless.bold23),
          centerTitle: true,
        ),
        body: OrdersViewBodyBlocBuilder(),
      ),
    );
  }
}

class OrdersViewBodyBlocBuilder extends StatefulWidget {
  const OrdersViewBodyBlocBuilder({super.key});

  @override
  State<OrdersViewBodyBlocBuilder> createState() =>
      _OrdersViewBodyBlocBuilderState();
}

class _OrdersViewBodyBlocBuilderState extends State<OrdersViewBodyBlocBuilder> {
  @override
  void initState() {
    context.read<FetchOrdersCubit>().fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrdersCubit, FetchOrdersState>(
      builder: (context, state) {
        if (state is FetchOrdersSuccess) {
          return OrdersViewBody(orders: state.orders);
        } else if (state is FetchOrdersFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return Skeletonizer(
            enabled: true,
            child: OrdersViewBody(orders: [getDummyOrder(), getDummyOrder()]),
          );
        }
      },
    );
  }
}
