part of 'fetch_orders_cubit.dart';

sealed class FetchOrdersState {}

final class FetchOrdersInitial extends FetchOrdersState {}

final class FetchOrdersLoading extends FetchOrdersState {}

final class FetchOrdersFailure extends FetchOrdersState {
  final String errMessage;

  FetchOrdersFailure({required this.errMessage});
}

final class FetchOrdersSuccess extends FetchOrdersState {
  final List<OrderEntity> orders;

  FetchOrdersSuccess({required this.orders});
}
