import 'package:dartz/dartz.dart';
import 'package:e_commarce/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:e_commarce/data/model/failures.dart';
import 'package:e_commarce/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commarce/domain/repository/register_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, RegisterResponseEntity>> register(String name,
      String email, String phone, String password, String rePassword) async {
    var either = await authRemoteDataSource.register(
        name, email, phone, password, rePassword);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
