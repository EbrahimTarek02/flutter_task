import 'dart:async';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/data/models/get_products_response/get_products_response.dart';
import 'package:flutter_task/domain/use_cases/get_products_use_case/get_products_use_case.dart';
import 'package:flutter_task/domain/use_cases/search_for_product_use_case/search_for_product_use_case.dart';
import 'package:flutter_task/ui/screens/products/products_states.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';

@injectable
class ProductsViewModel extends Cubit<ProductsStates> {
  GetProductsUseCase getProductsUseCase;
  SearchForProductUseCase searchForProductUseCase;
  Timer? debounce;
  TextEditingController searchController = TextEditingController();

  ProductsViewModel(this.getProductsUseCase, this.searchForProductUseCase) : super(ProductsInitialState());

  int calculateProductPriceBeforeDiscount(num? originalPrice, num? discountPercentage) {
    if (originalPrice == null) return 0;

    if (discountPercentage == null) return originalPrice.ceil();

    return (originalPrice + (originalPrice * (discountPercentage / 100))).ceil();
  }

  Future<void> getProducts() async{
    emit(ProductsLoadingState());

    Either<String, GetProductsResponse> response = await getProductsUseCase.execute();

    response.fold((errorMessage) {
      emit(ProductsErrorState(errorMessage));
    }, (success) {
      emit(ProductsSuccessState(success));
    });
  }

  Future<void> searchForProducts() async{
    if (debounce?.isActive ?? false) debounce?.cancel();

    debounce = Timer(const Duration(milliseconds: 500), () async{
      emit(ProductsLoadingState());

      Either<String, GetProductsResponse> response = await searchForProductUseCase.execute(searchController.text);

      response.fold((errorMessage) {
        emit(ProductsErrorState(errorMessage));
      }, (success) {
        emit(ProductsSuccessState(success));
      });
    });
  }
}