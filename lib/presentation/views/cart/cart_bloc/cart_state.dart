part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<CartModel> cartList;

  const CartState(this.cartList);

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {
  const CartInitial(super.cartList);
}
class CartLoading extends CartState {
  const CartLoading(super.cartList);
}

class CartLoaded extends CartState {
  const CartLoaded(super.cartList);
}
