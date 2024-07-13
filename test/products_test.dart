import 'package:flutter_task/domain/di/di.dart';
import 'package:flutter_task/ui/screens/products/products_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  configureDependencies();

  group('test calculate product price before discount', (){
    test('discount is null', (){
      // Arrange
      num? originalPrice = 100;
      num? discountPercentage;
      ProductsViewModel productsViewModel = getIt<ProductsViewModel>();

      // Act
      int result = productsViewModel.calculateProductPriceBeforeDiscount(originalPrice, discountPercentage);

      // Assert
      expect(result, 100);
    });

    test('price is null', (){
      // Arrange
      num? originalPrice;
      num? discountPercentage = 10;
      ProductsViewModel productsViewModel = getIt<ProductsViewModel>();

      // Act
      int result = productsViewModel.calculateProductPriceBeforeDiscount(originalPrice, discountPercentage);

      // Assert
      expect(result, 0);
    });

    test('both price and discount are null', (){
      // Arrange
      num? originalPrice;
      num? discountPercentage;
      ProductsViewModel productsViewModel = getIt<ProductsViewModel>();

      // Act
      int result = productsViewModel.calculateProductPriceBeforeDiscount(originalPrice, discountPercentage);

      // Assert
      expect(result, 0);
    });

    test('both price and discount are provided', (){
      // Arrange
      num? originalPrice = 100;
      num? discountPercentage = 10;
      ProductsViewModel productsViewModel = getIt<ProductsViewModel>();

      // Act
      int result = productsViewModel.calculateProductPriceBeforeDiscount(originalPrice, discountPercentage);

      // Assert
      expect(result, 110);
    });
  });
}