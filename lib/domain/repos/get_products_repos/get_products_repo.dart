import 'package:either_dart/either.dart';
import 'package:flutter_task/data/models/get_products_response/get_products_response.dart';

abstract class GetProductsRepo {
  Future<Either<String, GetProductsResponse>> getProducts();
}