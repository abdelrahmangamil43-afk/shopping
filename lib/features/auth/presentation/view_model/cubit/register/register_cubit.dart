import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/core/network/api_result.dart';
import 'package:flutter_application_1/features/auth/data/api/auth_api.dart';
import 'package:flutter_application_1/features/auth/data/models/register_request_model.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  String? messageSuccess;
  String? messageError;

  Future<void> register(RegisterRequestModel request) async {
    emit(RegisterLoading());
    final result = await AuthApi.register(request);
    switch (result) {
      case Success<String>():
        messageSuccess = result.data;
        emit(RegisterSuccess());
      case Error<String>():
        messageError = result.error;
        emit(RegisterError());
    }
  }
}
