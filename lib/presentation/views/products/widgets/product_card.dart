import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_app/infrastructure/models/product.dart';
import 'package:ecom_app/presentation/views/products/product_details.dart';
import 'package:ecom_app/presentation/views/products/products_listing.dart';
import 'package:flutter/material.dart';

import '../../../../configs/front_end_configs.dart';

class ProductCardWidget extends StatelessWidget {
  final Product model;

  const ProductCardWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailsView(model: model)));
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                width: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffF0F1F3)),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: model.imageUrl.toString(),
                      fit: BoxFit.cover,
                      height: 150,
                      width: 150,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Image.asset(
                        'assets/images/ph.jpg',
                        height: 150,
                        width: 150,
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        'assets/images/ph.jpg',
                        height: 150,
                        width: 150,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: 165,
                height: 35,
                child: Text(model.name.toString(),
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: FrontEndConfigs.kPrimaryColor)),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('\$${model.price!.current!.value.toString()}',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: Colors.black)),
                ],
              )
            ],
          )),
    );
  }
}
