import 'package:e_commarce/data/model/failures.dart';
import 'package:e_commarce/domain/entities/RegisterResponseEntity.dart';

abstract class LoginStates {}

class InitialLoginStates extends LoginStates {}

class LoadingLoginStates extends LoginStates {}

class SucessLoginStates extends LoginStates {
  RegisterResponseEntity registerResponseEntity;

  SucessLoginStates({required this.registerResponseEntity});
}

class ErrorLoginStates extends LoginStates {
  Failure failure;

  ErrorLoginStates({required this.failure});
}
