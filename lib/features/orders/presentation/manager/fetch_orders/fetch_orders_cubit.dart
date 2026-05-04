import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/repos/order_repo.dart';

part 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  FetchOrdersCubit(this.ordersrepo) : super(FetchOrdersInitial());
  final OrderRepo ordersrepo;
  Future<void> fetchOrders() async {
    emit(FetchOrdersLoading());
    final orders = await ordersrepo.fetchOrders();
    orders.fold(
      (failure) => emit(FetchOrdersFailure(errMessage: failure.message)),
      (orders) => emit(FetchOrdersSuccess(orders: orders)),
    );
  }
}
