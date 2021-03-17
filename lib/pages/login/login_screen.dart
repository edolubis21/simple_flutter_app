import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_flutter_app/blocs/auth/auth_bloc.dart';
import 'package:simple_flutter_app/blocs/form_bloc_login/form_bloc_login.dart';
import 'package:simple_flutter_app/widgets/textfield.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormBlocLogin(authBloc: context.read<AuthBloc>()),
      child: StatefulLoginPage(),
    );
  }
}

class StatefulLoginPage extends StatefulWidget {
  @override
  _StatefulLoginPageState createState() => _StatefulLoginPageState();
}

class _StatefulLoginPageState extends State<StatefulLoginPage> {
  FormBlocLogin formBloc;

  @override
  void initState() {
    super.initState();
    formBloc = context.read<FormBlocLogin>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formBloc.formKey,
              child: Column(
                children: [
                  TextFieldCustom(
                    label: "Email",
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    controller: formBloc.controllerEmail,
                    validator: formBloc.validateEmail,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  TextFieldCustom(
                    label: "Password",
                    obscureText: true,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    controller: formBloc.controllerPassword,
                    validator: formBloc.validatePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  RaisedButton(
                    onPressed: () => formBloc.onSubmitLogin(),
                    child: Text("Login"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
