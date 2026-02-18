import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  login({required String email, required String password}) async {
    emit(AuthLoading());

    if (email == email && password == password) {
      emit(AuthLoginSuccess());
    } else {
      emit(AuthError("Invalid email or password"));
    }
  }
}
