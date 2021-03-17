import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:simple_flutter_app/blocs/theme/theme_event.dart';
import 'package:simple_flutter_app/blocs/theme/theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(theme: lightMode));

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    yield ThemeState(theme: event.theme);
  }

  void changeTheme() {
    if (state.theme == lightMode) {
      add(ThemeEvent(theme: darkMode));
    } else {
      add(ThemeEvent(theme: lightMode));
    }
  }

  @override
  ThemeState fromJson(Map<String, dynamic> json) {
    try {
      if (json["theme"] != null) {
        return ThemeState(theme: json["theme"]);
      }
      return ThemeState(theme: lightMode);
    } catch (_) {
      return ThemeState(theme: lightMode);
    }
  }

  @override
  Map<String, dynamic> toJson(ThemeState state) {
    try {
      final theme = {"theme": state.theme};
      return theme;
    } catch (_) {
      return null;
    }
  }
}
