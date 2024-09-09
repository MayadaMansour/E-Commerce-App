import 'package:dartz/dartz.dart';
import 'package:e_commarce/data/model/failures.dart';
import 'package:e_commarce/domain/entities/RegisterResponseEntity.dart';

abstract class AuthRepository {
  Future<Either<Failure, RegisterResponseEntity>> register(String name,
      String email, String phone, String password, String rePassword);
}
