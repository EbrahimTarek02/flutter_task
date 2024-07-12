abstract class ProductsStates {}

class ProductsInitialState extends ProductsStates {}

class ProductsLoadingState extends ProductsStates {}

class ProductsSuccessState<Type> extends ProductsStates {
  Type data;

  ProductsSuccessState(this.data);
}

class ProductsErrorState extends ProductsStates {
  String errorMessage;

  ProductsErrorState(this.errorMessage);
}