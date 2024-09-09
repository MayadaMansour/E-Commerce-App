import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commarce/core/constants.dart';
import 'package:e_commarce/data/api_manager.dart';
import 'package:e_commarce/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:e_commarce/data/model/RegisterResponseDTO.dart';
import 'package:e_commarce/data/model/failures.dart';
import 'package:e_commarce/domain/entities/RegisterResponseEntity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failure, RegisterResponseEntity>> register(String name,
      String email, String phone, String password, String rePassword) async {
    try {
      // List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();
      // if (connectivityResult == ConnectivityResult.none) {
      //   return Left(NetWorkFailure(errorMsg: "No Internet Connection"));
      // }
      var response = await apiManager.postData(Constants.register, body: {
        "name": name,
        "email": email,
        "password": password,
        "rePassword": rePassword,
        "phone": phone,
      });

      var registerResponse = RegisterResponseDto.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(registerResponse);
      } else {
        print(registerResponse.message);
        return Left(ServerFailure(errorMsg: registerResponse.message!));
      }
    } catch (e) {
      print(e.toString());
      return Left(Failure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RegisterResponseEntity>> login(
      String email, String password) async {
    try {
      // List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();
      // if (connectivityResult == ConnectivityResult.none) {
      //   return Left(NetWorkFailure(errorMsg: "No Internet Connection"));
      // }
      var response = await apiManager.postData(Constants.signIn, body: {
        "email": email,
        "password": password,
      });

      var loginResponse = RegisterResponseDto.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(loginResponse);
      } else {
        print(loginResponse.message);
        return Left(ServerFailure(errorMsg: loginResponse.message!));
      }
    } catch (e) {
      print(e.toString());
      return Left(Failure(errorMsg: e.toString()));
    }
  }
}
