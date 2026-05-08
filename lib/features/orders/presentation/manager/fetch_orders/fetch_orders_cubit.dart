import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/repos/order_repo.dart';

part 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  FetchOrdersCubit(this.ordersrepo) : super(FetchOrdersInitial());
  final OrderRepo ordersrepo;
  StreamSubscription? _ordersSubscription;
  void fetchOrders() {
    emit(FetchOrdersLoading());
    _ordersSubscription = ordersrepo.fetchOrders().listen((result) {
      result.fold(
        (l) {
          emit(FetchOrdersFailure(errMessage: l.message));
        },
        (r) {
          emit(FetchOrdersSuccess(orders: r));
        },
      );
    });
  }

  @override
  Future<void> close() {
    _ordersSubscription?.cancel();
    return super.close();
  }
}
