import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String image;
  final VoidCallback onTap;

  ImageContainer(
      {required this.onTap,
      required this.image,
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 134,
          width: 134,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xffE9ECEF)),
          child: Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 89.81,
                  width: 89.81,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned.fill(
                  bottom: 3,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 24.79,
                      width: 24.79,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff7663EB)),
                      child: const Center(
                          child: Icon(Icons.camera_alt,
                              color: Colors.white, size: 12)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
