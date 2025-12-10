import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);
}

class NoUserFound extends Failure {
  const NoUserFound(super.message);

  @override
  List<Object?> get props => [];
}

class UserAlreadyExists extends Failure {
  const UserAlreadyExists(super.message);

  @override
  List<Object?> get props => [];
}

class CommonFailure extends Failure {
  const CommonFailure(super.message);

  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failure {
  const NetworkFailure({required String message}) : super(message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  @override
  List<Object?> get props => [message];
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);

  @override
  List<Object?> get props => [message];
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message);

  @override
  List<Object?> get props => [message];
}
