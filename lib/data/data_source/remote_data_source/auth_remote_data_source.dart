import 'package:dartz/dartz.dart';

import '../../../domain/entities/RegisterResponseEntity.dart';
import '../../model/failures.dart';

abstract class AuthRemoteDataSource{
  Future<Either<Failure, RegisterResponseEntity>> register(String name,
      String email, String phone, String password, String rePassword);
  Future<Either<Failure, RegisterResponseEntity>> login(
      String email, String password);
}