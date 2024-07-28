import 'dart:async';
import 'dart:developer';

import 'package:ecom_app/infrastructure/models/cart.dart';
import 'package:ecom_app/infrastructure/models/product.dart';
import 'package:ecom_app/infrastructure/services/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartInitial([])) {
    on<CartEvent>((event, emit) async {
      if (event is GetCartListing) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.getString('CART_DATA') != null) {
          var cartModel = cartModelFromJson(prefs.getString('CART_DATA')!);
          emit(CartLoaded(cartModel));
        } else {
          emit(const CartLoaded([]));
        }
      } else if (event is AddToCart) {
        emit(const CartLoading([]));
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.getString('CART_DATA') != null) {
          var cartModel = cartModelFromJson(prefs.getString('CART_DATA')!);
          bool flag = false;
          cartModel.map((e) {
            if (e.docID == event.model.docID) {
              flag = true;
            }
          }).toList();
          if (!flag) {
            cartModel.add(event.model);
            prefs.setString('CART_DATA', cartModelToJson(cartModel));
          } else {
            cartModel.map((e) {
              if (e.docID == event.model.docID) {
                e.quantity += 1;
              }
            }).toList();

            prefs.setString('CART_DATA', cartModelToJson(cartModel));
          }

          emit(CartLoaded(cartModel));
        } else {
          List<CartModel> cartModel = [];
          cartModel.add(event.model);
          prefs.setString('CART_DATA', cartModelToJson(cartModel));

          emit(CartLoaded(cartModel));
        }
      } else if (event is IncrementQuantity) {
        emit(const CartLoading([]));
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var cartModel = cartModelFromJson(prefs.getString('CART_DATA')!);

        cartModel.map((e) {
          if (e.docID == event.model.docID) {
            e.quantity += 1;
          }
        }).toList();

        prefs.setString('CART_DATA', cartModelToJson(cartModel));

        emit(CartLoaded(cartModel));
      } else if (event is DecrementQuantity) {
        emit(const CartLoading([]));
        log('dec');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var cartModel = cartModelFromJson(prefs.getString('CART_DATA')!);
        cartModel.map((e) {
          if (e.docID == event.model.docID) {
            e.quantity -= 1;
          }
        }).toList();
        prefs.setString('CART_DATA', cartModelToJson(cartModel));

        emit(CartLoaded(cartModel));
      } else if (event is RemoveFromCart) {
        emit(const CartLoading([]));
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var cartModel = cartModelFromJson(prefs.getString('CART_DATA')!);
        cartModel.removeWhere((e) {
          return e.docID == event.model.docID;
        });
        prefs.setString('CART_DATA', cartModelToJson(cartModel));

        emit(CartLoaded(cartModel));
      }
    });
  }
}
