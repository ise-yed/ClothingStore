import 'package:bloc/bloc.dart';
import 'package:clothingstore/data/model/product.dart';
import 'package:clothingstore/data/services/product.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async{
          if (event is ProductDetailLoadDataEvent) {
        emit(ProductDetailLoadingState());
        try {
          var response = await ProductServices().getDetailScreenData(event.id);
          emit(ProductDetailSuccessState(response));
        } catch (e) {
          emit(ProductErrorState(e.toString()));
        }
      } 
    });
  }
}
