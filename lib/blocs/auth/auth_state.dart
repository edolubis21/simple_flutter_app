import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class AuthLoggedIn extends AuthState {
  final bool isLoggedIn;
  final String token;

  AuthLoggedIn({this.isLoggedIn, this.token});

  @override
  List<Object> get props => [isLoggedIn, token];
}

class AuthLoggedOut extends AuthState {
  @override
  List<Object> get props => [];
}
