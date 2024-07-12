
import 'package:either_dart/either.dart';
import 'package:flutter_task/data/models/get_products_response/get_products_response.dart';
import 'package:flutter_task/domain/repos/get_products_repos/get_products_repo.dart';
import 'package:flutter_task/domain/repos/get_products_repos/get_products_repo_ds.dart';
import 'package:flutter_task/ui/utils/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

@Injectable(as: GetProductsRepo)
class GetProductsRepoImpl extends GetProductsRepo {
  GetProductsRepoDs getProductsRepoDs;

  GetProductsRepoImpl(this.getProductsRepoDs);

  @override
  Future<Either<String, GetProductsResponse>> getProducts() async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return getProductsRepoDs.getProducts();
    }
    else{
      return const Left(Constants.networkErrorMessage);
    }
  }

}