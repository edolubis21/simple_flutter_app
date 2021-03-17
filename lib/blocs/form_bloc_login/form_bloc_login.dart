import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_flutter_app/blocs/auth/auth_bloc.dart';
import 'package:simple_flutter_app/blocs/auth/auth_event.dart';
import 'package:simple_flutter_app/blocs/form_bloc_login/etinity/validates.dart';
import 'package:simple_flutter_app/repositories/auth.dart';
import 'etinity/controllers.dart';
import 'etinity/state.dart';

class FormBlocLogin extends Cubit<LoginState> with controllers, validates {
  FormBlocLogin({@required this.authBloc}) : super(LoginState());

  final AuthBloc authBloc;

  void onSubmitLogin() async {
    if (formKey.currentState.validate()) {
      try {
        final data = await AuthRepositories.authLogin(email: controllerEmail.text, password: controllerPassword.text);
        if (data.token != null) {
          authBloc.add(AuthLogin(token: data.token));
          return;
        }
        throw Exception("");
      } catch (_) {
        authBloc.add(AuthLogout());
      }
    }
  }
}
