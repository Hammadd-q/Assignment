import 'package:ecom_app/presentation/views/product_detail_screen/product_detail_screen.dart';
import 'package:ecom_app/presentation/views/products/products_listing.dart';
import 'package:flutter/material.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Raleway',
        bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.white, elevation: 0),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ProductListingView(),
    );
  }
}
