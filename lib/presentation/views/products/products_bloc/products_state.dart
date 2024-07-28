part of 'products_bloc.dart';

@immutable
abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final ProductListingModel model;

  const ProductsLoaded(this.model);
}

class ProductsFailed extends ProductsState {
  final String message;

  const ProductsFailed(this.message);
}
