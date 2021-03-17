import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:simple_flutter_app/blocs/auth/auth_bloc.dart';
import 'package:simple_flutter_app/blocs/auth/auth_state.dart';
import 'package:simple_flutter_app/blocs/theme/theme_bloc.dart';
import 'package:simple_flutter_app/blocs/theme/theme_state.dart';
import 'package:simple_flutter_app/pages/home/home_screen.dart';
import 'package:simple_flutter_app/pages/login/login_screen.dart';
import 'package:simple_flutter_app/theme.dart';

import 'blocs/bottom_tab/bottom_tab_bloc.dart';
import 'blocs/bottom_tab/bottom_tab_event.dart';
import 'blocs/bottom_tab/bottom_tab_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedCubit.storage = await HydratedStorage.build();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => BottomTabBloc(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
          lazy: false,
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) => MaterialApp(
        title: 'Flutter Demo',
        theme: buildTheme(context, themeState.theme),
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            if (authState is AuthLoggedIn) {
              return MyStatefulWidget();
            }
            return LoginPage();
          },
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  BottomTabBloc bottomTabBloc;

  @override
  void initState() {
    super.initState();
    bottomTabBloc = context.read<BottomTabBloc>();
  }

  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Container(),
    Container(),
    Container(),
  ];

  void _onItemTapped(int index) async {
    bottomTabBloc.add(BottomTabEvent(index: index));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomTabBloc, BottomTabState>(
      builder: (context, bottomTabState) => Scaffold(
        body: _widgetOptions[bottomTabState.index],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: bottomTabState.index,
          onTap: (index) => _onItemTapped(index),
          unselectedItemColor: const Color(0xffa0a7b1),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.phone), label: "Phone"),
            BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: "Profile"),
            BottomNavigationBarItem(icon: Icon(Icons.build), label: "setting")
          ],
        ),
      ),
    );
  }
}
