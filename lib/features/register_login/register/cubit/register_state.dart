import 'package:e_commarce/data/model/failures.dart';
import 'package:e_commarce/domain/entities/RegisterResponseEntity.dart';

abstract class RegisterStates {}

class InitialRegisterState extends RegisterStates {}

class LoadingRegisterState extends RegisterStates {}

class SucessRegisterState extends RegisterStates {
  RegisterResponseEntity registerResponseEntity;

  SucessRegisterState({required this.registerResponseEntity});
}

class ErrorRegisterState extends RegisterStates {
  Failure failure;

  ErrorRegisterState({required this.failure});
}
