import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app/features/cubit/cubit/lap_state.dart';
import 'package:project_app/features/model/lap_model.dart';

class LaptopCubit extends Cubit<LaptopState> {
  LaptopCubit() : super(LaptopInitial());

  final Dio dio = Dio();

  void getLaptops() async {
    emit(LaptopLoading());

    try {
      final response = await dio.get(
        "https://elwekala.onrender.com/product/Laptops",
      );

      final List data = response.data['product'];

      final laptops = data.map((e) => LaptopModel.fromJson(e)).toList();

      emit(LaptopSuccess(laptops));
    } catch (e) {
      emit(LaptopError("Failed To Load Data"));
    }
  }
}
