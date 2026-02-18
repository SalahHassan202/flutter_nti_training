import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  login({required String email, required String password}) async {
    final response = await dio.post(
      "https://elwekala.onrender.com/user/login",
      data: {"email": email, "password": password},
    );

    return response;
  }
}
