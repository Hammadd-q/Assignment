import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom_app/infrastructure/models/cart.dart';
import 'package:ecom_app/infrastructure/models/product.dart';
import 'package:ecom_app/presentation/views/cart/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configs/front_end_configs.dart';
import '../../../injection_container.dart';
import '../cart/cart_bloc/cart_bloc.dart';

class ProductDetailsView extends StatelessWidget {
  final Product model;

  const ProductDetailsView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CartBloc>(),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Scaffold(
            extendBody: true,
            body: _getBody(context),
          );
        },
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 350,
          child: Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(height: 350.0),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return CachedNetworkImage(
                        imageUrl: model.imageUrl.toString(),
                        fit: BoxFit.cover,
                        height: 350,
                        width: MediaQuery.of(context).size.width,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Image.asset(
                          'assets/images/ph.jpg',
                          height: 350,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          'assets/images/ph.jpg',
                          height: 350,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 22,
                          color: Colors.black,
                        ),
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                    Row(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(
                              CupertinoIcons.heart_fill,
                              size: 22,
                              color: Colors.red,
                            ),
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(
                             CupertinoIcons.share,
                              size: 22,
                              color: Colors.black,
                            ),
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(model.name.toString(),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: FrontEndConfigs.kPrimaryColor)),
        ),
        SizedBox(height: 10),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 17,
                            color: Color(0xff8DD0C1),
                          ),
                          SizedBox(width: 3),
                          Text('4.8',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)),
                          SizedBox(width: 3),
                          Text('117 Reviews',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                        ],
                      ),
                    )),
                SizedBox(width: 7),
                Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 17,
                            color: Color(0xffBFE600),
                          ),
                          SizedBox(width: 3),
                          Text('94%',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)),
                        ],
                      ),
                    )),
                SizedBox(width: 7),
                Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      child: Row(
                        children: [
                          Icon(Icons.chat_bubble, size: 17, color: Colors.grey),
                          SizedBox(width: 3),
                          Text('8',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)),
                        ],
                      ),
                    )),
              ],
            )),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xffF0F1F3)),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('\$${model.price!.current!.value.toString()}',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: FrontEndConfigs.kPrimaryColor)),
                      ],
                    ),
                    Icon(Icons.info_outline, color: Colors.grey, size: 17)
                  ],
                )),
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
              'A document with only text and no images. The formatting codes embedded in a word processing file are not normally visible but may contain other than text ...',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey)),
        ),
        SizedBox(height: 15),
        Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: 65,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<CartBloc>(context).add(AddToCart(
                    model: CartModel(
                        name: model.name.toString(),
                        price: model.price!.current!.value!.toInt(),
                        quantity: 1,
                        docID: model.id.toString(),
                        image: model.imageUrl.toString())));
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartView()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text(
                "Add to Cart",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Delivery on 26 August',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54)),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
