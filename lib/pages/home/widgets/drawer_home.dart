import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_flutter_app/blocs/auth/auth_bloc.dart';
import 'package:simple_flutter_app/blocs/auth/auth_event.dart';
import 'package:simple_flutter_app/blocs/theme/theme_bloc.dart';

class DrawerHome extends StatefulWidget {
  @override
  _DrawerHomeState createState() => _DrawerHomeState();
}

class _DrawerHomeState extends State<DrawerHome> {
  AuthBloc authBloc;
  ThemeBloc themeBloc;

  @override
  void initState() {
    super.initState();
    authBloc = context.read<AuthBloc>();
    themeBloc = context.read<ThemeBloc>();
  }

  void changeTheme() {
    themeBloc.changeTheme();
  }

  void logOut() {
    authBloc.add(AuthLogout());
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Text('Drawer Header'), IconButton(icon: Icon(Icons.wb_sunny_rounded), onPressed: () => changeTheme())],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          ListTile(
            title: Text('Logout'),
            trailing: Icon(Icons.logout),
            onTap: () => logOut(),
          ),
        ],
      ),
    );
  }
}
