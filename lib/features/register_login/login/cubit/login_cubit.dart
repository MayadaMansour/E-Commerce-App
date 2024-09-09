import 'package:bloc/bloc.dart';
import 'package:e_commarce/domain/use_case/register_use_case.dart';
import 'package:e_commarce/features/register_login/login/cubit/login_state.dart';
import 'package:e_commarce/features/register_login/register/cubit/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/model/failures.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  RegisterUseCase registerUseCase;

  LoginViewModel({required this.registerUseCase}) : super(InitialLoginStates());

  var emailController = TextEditingController(text: "maiar@gmail.com");
  var passwordController = TextEditingController(text: "mayada@1234");

  void login() async {
    emit(LoadingLoginStates());
    var either = await registerUseCase.invokeLogin(
      emailController.text,
      passwordController.text,
    );

    either.fold((error) {
      emit(ErrorLoginStates(failure: error));
    }, (response) {
      emit(SucessLoginStates(registerResponseEntity: response));
    });
  }
}
