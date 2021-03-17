import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_tab_event.dart';
import 'bottom_tab_state.dart';

class BottomTabBloc extends Bloc<BottomTabEvent, BottomTabState> {
  BottomTabBloc() : super(BottomTabState(index: 0));

  @override
  Stream<BottomTabState> mapEventToState(BottomTabEvent event) async* {
    yield BottomTabState(index: event.index);
  }
}
