part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class GetProductsListing extends ProductsEvent {
  final String token;

  const GetProductsListing(this.token);
}
