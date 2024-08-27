part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}
class ProductDetailLoadDataEvent extends ProductEvent {
  final int id;

  ProductDetailLoadDataEvent(this.id);
}
