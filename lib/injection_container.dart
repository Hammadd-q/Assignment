import 'dart:developer';

import 'package:ecom_app/infrastructure/services/product.dart';
import 'package:ecom_app/presentation/views/cart/cart_bloc/cart_bloc.dart';
import 'package:ecom_app/presentation/views/products/products_bloc/products_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///Blocs
  sl.registerFactory<ProductsBloc>(() => ProductsBloc(sl()));
  sl.registerFactory<CartBloc>(() => CartBloc());

  ///Services
  sl.registerLazySingleton(() => ProductRepositoryImp());
}
