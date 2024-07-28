import 'dart:async';
import 'dart:developer';

import 'package:ecom_app/infrastructure/models/product.dart';
import 'package:ecom_app/infrastructure/services/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepositoryImp repositoryImp;

  ProductsBloc(this.repositoryImp) : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) async {
      if (event is GetProductsListing) {
        try {
          emit(ProductsLoading());

          final failureOrSuccess = await repositoryImp.getProducts(
            event.token.toString(),
          );
          failureOrSuccess.fold((l) => emit(ProductsFailed(l.error.toString())),
              (r) {
            return emit(ProductsLoaded(r));
          });
        } catch (e) {
          rethrow;
        }
      }
    });
  }
}
