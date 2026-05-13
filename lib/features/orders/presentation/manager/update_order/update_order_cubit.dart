import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/repos/order_repo.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit(this.orderRepo) : super(UpdateOrderInitial());
  final OrderRepo orderRepo;
  Future<void> updateOrder({
    required String orderID,
    required OrderStatusEnum status,
  }) async {
    emit(UpdateOrderLoading());
    final result = await orderRepo.UpdateOrder(
      orderID: orderID,
      status: status,
    );
    result.fold(
      (l) => emit(UpdateOrderFailure(errMessage: l.toString())),
      (r) => emit(UpdateOrderSuccess()),
    );
  }
}
