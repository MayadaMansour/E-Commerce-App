import 'package:dartz/dartz.dart';
import 'package:e_commarce/domain/repository/register_repo.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/failures.dart';
import '../entities/RegisterResponseEntity.dart';

@injectable
class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failure, RegisterResponseEntity>> invokeRegister(String name,
      String email, String phone, String password, String rePassword) {
    return authRepository.register(name, email, phone, password, rePassword);
  }

  Future<Either<Failure, RegisterResponseEntity>> invokeLogin(
      String email, String password) {
    return authRepository.login(email, password);
  }
}
