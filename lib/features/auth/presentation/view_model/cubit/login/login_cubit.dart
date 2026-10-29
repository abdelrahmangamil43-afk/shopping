import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/core/network/api_result.dart';
import 'package:flutter_application_1/features/auth/data/api/auth_api.dart';
import 'package:flutter_application_1/features/auth/data/models/login_response_model.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  LoginResponseModel? loginResponseModel;
  String? messageError;

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    final result = await AuthApi.login(email, password);
    switch (result) {
      case Success<LoginResponseModel>():
        loginResponseModel = result.data;
        emit(LoginSuccess());

      case Error<LoginResponseModel>():
        messageError = result.error;
        emit(LoginLoading());
    }
  }
}
