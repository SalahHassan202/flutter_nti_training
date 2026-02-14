import 'package:api_app/features/home/models/article_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final Dio dio = Dio();

  void getProducts() async {
    emit(HomeLoading());

    try {
      final response = await dio.get("https://dummyjson.com/products");

      final List data = response.data["products"];

      final products = data.map((e) => ProductModel.fromJson(e)).toList();

      emit(HomeSuccess(products));
    } catch (e) {
      emit(HomeError("Failed To Load Data"));
    }
  }
}
