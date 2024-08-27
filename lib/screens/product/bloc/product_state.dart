part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

// ! Product Detail
class ProductDetailLoadingState extends ProductState {}

class ProductDetailSuccessState extends ProductState {
  final ProductModel productModel;

  ProductDetailSuccessState(this.productModel);
}

class ProductErrorState extends ProductState {
  final String error;

  ProductErrorState(this.error);
}

// ! Product List
class ProductListLoadingState extends ProductState {}

class ProductListSuccessState extends ProductState {
  final ProductModel
   productModel;

  ProductListSuccessState(this.productModel);
}

class ProductListErrorState extends ProductState {
  final String error;

  ProductListErrorState(this.error);
}
