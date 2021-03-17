import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:simple_flutter_app/blocs/auth/auth_event.dart';
import 'package:simple_flutter_app/blocs/auth/auth_state.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthLoggedOut());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthLogin) {
      yield AuthLoggedIn(token: event.token, isLoggedIn: true);
    }
    if (event is AuthLogout) {
      clear();
      yield AuthLoggedOut();
    }
  }

  @override
  Map<String, dynamic> toJson(AuthState state) {
    try {
      if (state is AuthLoggedIn) {
        final Map<String, dynamic> token = {"token": state.token};
        return token;
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  AuthState fromJson(Map<String, dynamic> json) {
    try {
      if (json["token"] != null) {
        return AuthLoggedIn(isLoggedIn: true, token: json["token"]);
      }
      return AuthLoggedOut();
    } catch (_) {
      return AuthLoggedOut();
    }
  }
}
