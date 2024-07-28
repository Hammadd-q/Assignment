import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_app/injection_container.dart';
import 'package:ecom_app/presentation/views/products/product_details.dart';
import 'package:ecom_app/presentation/views/products/products_bloc/products_bloc.dart';
import 'package:ecom_app/presentation/views/products/widgets/category_card.dart';
import 'package:ecom_app/presentation/views/products/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configs/front_end_configs.dart';

class ProductListingView extends StatelessWidget {
  const ProductListingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductsBloc>(),
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsInitial || state is ProductsLoading) {
            BlocProvider.of<ProductsBloc>(context).add(const GetProductsListing(
                '7c14cd1833msh06cee20fbae79bdp19c0cajsn0a3f8b25d04e'));

            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductsLoaded) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xffC3E604)),
                        ),
                        const Column(
                          children: [
                            Text('Delivery Address',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff9D9FA3))),
                            SizedBox(
                              width: 170,
                              child: Text('92 High Street, London',
                                  style: TextStyle(
                                      fontSize: 14,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black)),
                            )
                          ],
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xffF0F1F3)),
                          child: const Center(
                            child: Icon(CupertinoIcons.bell, size: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Categories',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: FrontEndConfigs.kPrimaryColor)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('See all',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey)),
                            const SizedBox(width: 8),
                            Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.withOpacity(0.3)),
                                child: const Center(
                                  child: Icon(Icons.arrow_forward_ios_sharp,
                                      size: 10),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 85,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return const CategoryCard();
                        }),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text('Flash Sale',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: FrontEndConfigs.kPrimaryColor)),
                            const SizedBox(width: 10),
                            Container(
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xffC3E603)),
                                child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Center(
                                      child: Text('02:59:23',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black)),
                                    )))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('See all',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey)),
                            const SizedBox(width: 8),
                            Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.withOpacity(0.3)),
                                child: const Center(
                                  child: Icon(Icons.arrow_forward_ios_sharp,
                                      size: 10),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.model.products!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductCardWidget(
                              model: state.model.products![index]);
                        }),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          } else if (state is ProductsFailed) {
            return Center(
              child: Text(state.message.toString()),
            );
          } else {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
        },
      ),
    );
  }
}
