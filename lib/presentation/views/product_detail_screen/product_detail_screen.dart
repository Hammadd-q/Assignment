import 'package:flutter/material.dart';
import '../../../../configs/front_end_configs.dart';
import 'layout/body.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        body: const ProductDetailScreenViewe());
  }
}
