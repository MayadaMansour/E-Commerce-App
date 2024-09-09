class Failure{
  String errorMsg;
  Failure({required this.errorMsg});
}

class ServerFailure extends Failure{
  ServerFailure({required super.errorMsg});
}
class NetWorkFailure extends Failure{
  NetWorkFailure({required super.errorMsg});
}