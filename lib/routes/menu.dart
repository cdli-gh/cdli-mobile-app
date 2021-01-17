import 'package:bloc/bloc.dart';
import 'package:cdli_tablet_app/screens/main_screen.dart';
import 'package:cdli_tablet_app/screens/grid_screen.dart';
import 'package:cdli_tablet_app/screens/list_screen.dart';
import 'package:cdli_tablet_app/screens/about_screen.dart';
import 'package:cdli_tablet_app/screens/help_screen.dart';
import 'package:cdli_tablet_app/screens/recently_viewed_screen.dart';

enum NavigationEvents {
  DashboardClickedEvent,
  GridClickedEvent,
  ListClickedEvent,
  AboutClickedEvent,
  HelpClickedEvent,
  RecentlyViewedClickedEvent,
}

abstract class NavigationState {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationState> {
  final Function onMenuTap;

  NavigationBloc({this.onMenuTap});

  @override
  NavigationState get initialState => MainScreen(
        onMenuTap: onMenuTap,
      );

  @override
  Stream<NavigationState> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.DashboardClickedEvent:
        yield MainScreen(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.GridClickedEvent:
        yield GridScreen(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.ListClickedEvent:
        yield ListScreen(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.AboutClickedEvent:
        yield AboutScreen(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.HelpClickedEvent:
        yield HelpScreen(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.RecentlyViewedClickedEvent:
        yield RecentlyViewedScreen(
          onMenuTap: onMenuTap,
        );
    }
  }
}
