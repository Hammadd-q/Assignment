import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FrontEndConfigs {
  static const Color kPrimaryColor = Color(0xff0B0B0B);
  static const Color kWhiteColor = Color(0xffFFFFFF);

  static Widget getTopGradientWidget() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        gradient: RadialGradient(
          radius: 1,
          center: Alignment.topRight,
          colors: [
            Color(0xff818181),
            Color(0xff818181),
            Colors.black,
            Colors.black,
            // Colors.black,
          ],
        ),
      ),
    );
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            gradient: RadialGradient(
              radius: 1,
              center: Alignment.topRight,
              colors: [
                Color(0xff818181),
                Color(0xff818181),
                Colors.black,
                Colors.black,
                // Colors.black,
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            gradient: RadialGradient(
              radius: 0.5,
              center: Alignment.bottomLeft,
              colors: [
                const Color(0xff818181),
                Colors.black.withOpacity(0.8),
              ],
            ),
          ),
        ),
      ],
    );
  }
  static Widget getBottomGradientWidget() {
    return   Container(
      decoration: BoxDecoration(
        color: Colors.black,
        gradient: RadialGradient(
          radius: 0.5,
          center: Alignment.bottomLeft,
          colors: [
            const Color(0xff818181),
            Colors.black.withOpacity(0.8),
          ],
        ),
      ),
    );

  }
}
