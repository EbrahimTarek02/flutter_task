import 'package:either_dart/either.dart';
import 'package:flutter_task/data/models/get_products_response/get_products_response.dart';
import 'package:flutter_task/domain/repos/search_for_product_repos/search_for_product_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchForProductUseCase {
  SearchForProductRepo searchForProductRepo;

  SearchForProductUseCase(this.searchForProductRepo);

  Future<Either<String, GetProductsResponse>> execute(String searchQuery) {
    return searchForProductRepo.searchForProduct(searchQuery);
  }
}