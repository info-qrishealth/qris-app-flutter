part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  final Cart? cart;
  const CartState({this.cart});

  @override
  List<Object?> get props => [cart];
}

final class CartInitial extends CartState {}

final class CartUpdated extends CartState {
  const CartUpdated({required super.cart});
}
