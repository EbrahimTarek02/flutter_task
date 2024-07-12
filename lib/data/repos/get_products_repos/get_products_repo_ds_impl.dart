import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter_task/data/models/get_products_response/get_products_response.dart';
import 'package:flutter_task/domain/repos/get_products_repos/get_products_repo_ds.dart';
import 'package:flutter_task/ui/utils/constants.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetProductsRepoDs)
class GetProductsRepoDsImpl extends GetProductsRepoDs {
  @override
  Future<Either<String, GetProductsResponse>> getProducts() async{
    String baseUrl = "dummyjson.com";
    String endPoint = "products";

    // try {
      Uri uri = Uri.https(baseUrl, endPoint);

      Response response = await get(uri);

      GetProductsResponse getProductsResponse = GetProductsResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getProductsResponse);
      }
      else {
        return const Left(Constants.defaultErrorMessage);
      }
    // } catch(_) {
    //   return const Left(Constants.defaultErrorMessage);
    // }
  }

}