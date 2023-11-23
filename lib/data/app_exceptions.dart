class AppExceptions implements Exception{

  final _message;
  final _prefix;

  AppExceptions([this._message , this._prefix]);

  String toString(){
    return '$_prefix$_message';
  }

}

class InternetExaption extends AppExceptions{
  InternetExaption([String? message]) : super(message,'No internet');
}

class RequestTimeOutExaption extends AppExceptions{
  RequestTimeOutExaption([String? message]) : super(message,'Request Time Out');
}

class InvalidUrlExaption extends AppExceptions{
  InvalidUrlExaption([String? message]) : super(message,'Invalid Url Exaption');
}
class UnauthorizedException extends AppExceptions {
  UnauthorizedException([String? message]) : super(message, 'Unauthorized Exception');
}

class NotFoundException extends AppExceptions {
  NotFoundException([String? message]) : super(message, 'Not Found Exception');
}

class InternalServerErrorException extends AppExceptions {
  InternalServerErrorException([String? message]) : super(message, 'Internal Server Error Exception');
}
class FetchDataExaption extends AppExceptions{
  FetchDataExaption([String? message]) : super(message,'');
}
