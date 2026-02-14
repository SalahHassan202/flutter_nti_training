// abstract class HomeState {}

// class HomeInitial extends HomeState {}

// class HomeLoading extends HomeState {}

// class HomeSuccess extends HomeState {
//   final List articles;
//   HomeSuccess(this.articles);
// }

// class HomeError extends HomeState {
//   final String message;
//   HomeError(this.message);
// }

import 'package:api_app/features/home/models/article_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<ProductModel> products;
  HomeSuccess(this.products);
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
