part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetCartListing extends CartEvent {}

class AddToCart extends CartEvent {
  final CartModel model;

  const AddToCart({required this.model});
}

class RemoveFromCart extends CartEvent {
  final CartModel model;

  const RemoveFromCart({required this.model});
}

class IncrementQuantity extends CartEvent {
  final CartModel model;

  const IncrementQuantity({required this.model});
}

class DecrementQuantity extends CartEvent {
  final CartModel model;

  const DecrementQuantity({required this.model});
}
