import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_app/infrastructure/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  final CartModel model;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartWidget(
      {super.key,
      required this.model,
      required this.onIncrement,
      required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.check_box_outline_blank)),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: model.image.toString(),
                      fit: BoxFit.cover,
                      height: 70,
                      width: 70,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Image.asset(
                        'assets/images/ph.jpg',
                        height: 70,
                        width: 70,
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        'assets/images/ph.jpg',
                        height: 70,
                        width: 70,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    // color: Colors.blue,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.name.toString(),
                          style: const TextStyle(fontSize: 14),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "\$${model.price!}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: ()=>onDecrement(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color(0xff96d1c7)
                                            .withOpacity(0.7)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: Icon(
                                        CupertinoIcons.minus,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(model.quantity.toString()),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  onTap: ()=>onIncrement(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color(0xff96d1c7)
                                            .withOpacity(0.7)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: Icon(
                                        CupertinoIcons.add,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
