part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  final Cart cart;
  final CartSummary? cartSummary;
  const CartState({this.cart = const Cart(cartTests: []), this.cartSummary});

  @override
  List<Object?> get props => [cart, cartSummary];
}

final class CartInitial extends CartState {
  const CartInitial({super.cart, super.cartSummary});
}

final class CartUpdated extends CartState {
  const CartUpdated({required super.cart, super.cartSummary});
}
