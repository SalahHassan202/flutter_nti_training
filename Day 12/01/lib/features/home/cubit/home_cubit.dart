import 'package:api_app/features/home/cubit/home_state.dart';
import 'package:api_app/features/home/models/article_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final Dio dio = Dio(BaseOptions(baseUrl: "https://dev.to/api/"));

  void getArticles() async {
    emit(HomeLoading());
    try {
      var response = await dio.get("articles?per_page=30&top=7");
      final List data = response.data;
      final articles = data.map((e) => ArticleModel.fromJson(e)).toList();
      emit(HomeSuccess(articles));
    } catch (e) {
      emit(HomeError("Failed To Load Articles"));
    }
  }
}
