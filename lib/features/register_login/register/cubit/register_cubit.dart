import 'package:bloc/bloc.dart';
import 'package:e_commarce/domain/use_case/register_use_case.dart';
import 'package:e_commarce/features/register_login/register/cubit/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/model/failures.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase})
      : super(InitialRegisterState());

  var nameController = TextEditingController(text: "mayada");
  var emailController = TextEditingController(text: "maiar@gmail.com");
  var phoneController = TextEditingController(text: "01010700701");
  var passwordController = TextEditingController(text: "mayada@1234");
  var rePasswordController = TextEditingController(text: "mayada@1234");

  void register() async {
    emit(LoadingRegisterState());
    var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        phoneController.text,
        passwordController.text,
        rePasswordController.text);

    either.fold((error) {
      emit(ErrorRegisterState(failure: error));
    }, (response) {
      emit(SucessRegisterState(registerResponseEntity: response));
    });
  }
}
