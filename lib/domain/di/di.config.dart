// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repos/get_products_repos/get_products_repo_ds_impl.dart'
    as _i8;
import '../../data/repos/get_products_repos/get_products_repo_impl.dart'
    as _i10;
import '../../data/repos/search_for_product_repos/search_for_product_repo_ds_impl.dart'
    as _i4;
import '../../data/repos/search_for_product_repos/search_for_product_repo_impl.dart'
    as _i6;
import '../../ui/screens/products/products_view_model.dart' as _i13;
import '../repos/get_products_repos/get_products_repo.dart' as _i9;
import '../repos/get_products_repos/get_products_repo_ds.dart' as _i7;
import '../repos/search_for_product_repos/search_for_product_repo.dart' as _i5;
import '../repos/search_for_product_repos/search_for_product_repo_ds.dart'
    as _i3;
import '../use_cases/get_products_use_case/get_products_use_case.dart' as _i11;
import '../use_cases/search_for_product_use_case/search_for_product_use_case.dart'
    as _i12;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.SearchForProductRepoDs>(
        () => _i4.SearchForProductRepoDsImpl());
    gh.factory<_i5.SearchForProductRepo>(
        () => _i6.SearchForProductRepoImpl(gh<_i3.SearchForProductRepoDs>()));
    gh.factory<_i7.GetProductsRepoDs>(() => _i8.GetProductsRepoDsImpl());
    gh.factory<_i9.GetProductsRepo>(
        () => _i10.GetProductsRepoImpl(gh<_i7.GetProductsRepoDs>()));
    gh.factory<_i11.GetProductsUseCase>(
        () => _i11.GetProductsUseCase(gh<_i9.GetProductsRepo>()));
    gh.factory<_i12.SearchForProductUseCase>(
        () => _i12.SearchForProductUseCase(gh<_i5.SearchForProductRepo>()));
    gh.factory<_i13.ProductsViewModel>(() => _i13.ProductsViewModel(
          gh<_i11.GetProductsUseCase>(),
          gh<_i12.SearchForProductUseCase>(),
        ));
    return this;
  }
}
