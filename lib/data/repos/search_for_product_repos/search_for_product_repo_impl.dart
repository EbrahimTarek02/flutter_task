import 'package:either_dart/either.dart';
import 'package:flutter_task/data/models/get_products_response/get_products_response.dart';
import 'package:flutter_task/domain/repos/search_for_product_repos/search_for_product_repo.dart';
import 'package:flutter_task/domain/repos/search_for_product_repos/search_for_product_repo_ds.dart';
import 'package:flutter_task/ui/utils/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

@Injectable(as: SearchForProductRepo)
class SearchForProductRepoImpl extends SearchForProductRepo {
  SearchForProductRepoDs searchForProductRepoDs;

  SearchForProductRepoImpl(this.searchForProductRepoDs);

  @override
  Future<Either<String, GetProductsResponse>> searchForProduct(String searchQuery) async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return searchForProductRepoDs.searchForProduct(searchQuery);
    }
    else{
      return const Left(Constants.networkErrorMessage);
    }
  }

}