import 'package:flutter/material.dart';
import 'package:flutter_task/domain/di/di.dart';
import 'package:flutter_task/ui/screens/products/products_screen.dart';
import 'package:flutter_task/ui/utils/app_colors.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ProductsScreen.routeName,

      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,

        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          scrolledUnderElevation: 0.0
        )
      ),

      routes: {
        ProductsScreen.routeName : (_) => const ProductsScreen()
      },
    );
  }
}
