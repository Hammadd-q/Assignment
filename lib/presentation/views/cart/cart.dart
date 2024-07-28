import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_app/presentation/views/cart/widgets/cart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import '../products/products_bloc/products_bloc.dart';
import 'cart_bloc/cart_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff96d1c7),

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Container(),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.black,
                  size: 17,
                ),
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xff96d1c7).withOpacity(0.7)),
            ),
          )
        ],
        leadingWidth: 0,
      ),
      bottomSheet: _getBody(context),
      bottomNavigationBar:    Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: 65,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 12.0, vertical: 10),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(10))),
            child: const Text(
              "Checkout",
              style: TextStyle(
                  color: Colors.black, fontSize: 18),
            ),
          ),
        ),
      ),
      // bottomSheet: ,
    );
  }

  Widget _getBody(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CartBloc>(),
      child: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          log('Called from listen');
          BlocProvider.of<CartBloc>(context).add(GetCartListing());
        },
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            log(state.toString());
            if (state is CartInitial || state is CartLoading) {
              BlocProvider.of<CartBloc>(context).add(GetCartListing());
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CartLoaded) {
              return Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 18),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff96d1c7).withOpacity(0.7)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.location_on),
                                  Text("92 High Street, London"),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 17,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 18),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                              Icons.check_box_outline_blank)),
                                      const Text("Select All"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.ios_share)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.edit)),
                                    ],
                                  )
                                ],
                              ),
                              if (state.cartList.isEmpty)
                                Center(
                                  child: Text("Your Cart is empty."),
                                )
                              else
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: state.cartList.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, i) {
                                      return CartWidget(
                                        model: state.cartList[i],
                                        onDecrement: () {
                                          if (state.cartList[i].quantity == 1) {
                                            BlocProvider.of<CartBloc>(context)
                                                .add(RemoveFromCart(
                                                    model: state.cartList[i]));
                                          } else {
                                            BlocProvider.of<CartBloc>(context)
                                                .add(DecrementQuantity(
                                                    model: state.cartList[i]));
                                          }
                                        },
                                        onIncrement: () {
                                          BlocProvider.of<CartBloc>(context)
                                              .add(IncrementQuantity(
                                                  model: state.cartList[i]));
                                        },
                                      );
                                    }),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Text("hi");
            }
          },
        ),
      ),
    );
  }
}
