import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());

    await Future.delayed(const Duration(seconds: 2));

    if (email.isNotEmpty && password.isNotEmpty) {
      emit(AuthLoginSuccess());
    } else {
      emit(AuthError("Email or Password is empty"));
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String imageBase64,
  }) async {
    emit(AuthLoading());

    await Future.delayed(const Duration(seconds: 2));

    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      emit(AuthRegisterSuccess());
    } else {
      emit(AuthError("Please fill all fields"));
    }
  }
}
