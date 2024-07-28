import 'package:flutter/material.dart';


class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              height: 62,
              width: 62,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffF0F1F3),
              ),
              child: Center(
                  child: Image.asset(
                      'assets/images/ph.jpg',
                      height: 32,
                      width: 30)),
            ),
            const SizedBox(height: 5),
            const Text('Hotels',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff495057))),
          ],
        ));
  }
}
