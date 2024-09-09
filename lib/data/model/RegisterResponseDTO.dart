import 'package:e_commarce/domain/entities/RegisterResponseEntity.dart';

class RegisterResponseDto extends RegisterResponseEntity {
  RegisterResponseDto(
      {super.message, super.user, super.token, super.statusMsg});

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDTO.fromJson(json['user']) : null;
    token = json['token'];
  }
}

class UserDTO extends UserEntity {
  UserDTO({
    super.name,
    super.email,
  });

  UserDTO.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
  }
}
