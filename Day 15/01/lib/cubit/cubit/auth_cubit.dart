import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());

    try {
      await Future.delayed(const Duration(seconds: 2));

      if (email.isNotEmpty && password.isNotEmpty) {
        emit(AuthLoginSuccess());
      } else {
        emit(AuthError("Email or Password is empty"));
      }
    } catch (e) {
      emit(AuthError("Something went wrong"));
    }
  }
}
