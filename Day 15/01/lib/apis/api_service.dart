import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://elwekala.onrender.com/",
      headers: {"Content-Type": "application/json"},
    ),
  );

  // LOGIN
  Future<Response> login(String email, String password) async {
    return await dio.post(
      "user/login",
      data: {"email": email, "password": password},
    );
  }

  // REGISTER
  Future<Response> register({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String password,
  }) async {
    return await dio.post(
      "user/register",
      data: {
        "name": name,
        "email": email,
        "phone": phone,
        "nationalId": nationalId,
        "gender": gender,
        "password": password,
      },
    );
  }

  // ADD TO CART
  Future<Response> addToCart({
    required String nationalId,
    required String productId,
    required String quantity,
  }) async {
    return await dio.post(
      "cart/add",
      data: {
        "nationalId": nationalId,
        "productId": productId,
        "quantity": quantity,
      },
    );
  }
}
