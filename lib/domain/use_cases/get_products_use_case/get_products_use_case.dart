import 'package:either_dart/either.dart';
import 'package:flutter_task/data/models/get_products_response/get_products_response.dart';
import 'package:flutter_task/domain/repos/get_products_repos/get_products_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUseCase {
  GetProductsRepo getProductsRepo;

  GetProductsUseCase(this.getProductsRepo);

  Future<Either<String, GetProductsResponse>> execute() {
    return getProductsRepo.getProducts();
  }
}