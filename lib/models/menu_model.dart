import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cdli_tablet_app/routes/menu.dart';

class Menu extends StatelessWidget {
  final Animation<Offset> slideAnimation;
  final Animation<double> menuAnimation;
  final int selectedIndex;
  final Function onMenuItemClicked;

  const Menu(
      {Key key,
      this.slideAnimation,
      this.menuAnimation,
      this.selectedIndex,
      @required this.onMenuItemClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: ScaleTransition(
        scale: menuAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // CDLI APP
                    ListTile(
                      title: Text(
                        'CDLI APP',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontFamily: 'NotoSansJP',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    // Page View
                    ListTile(
                      leading: Icon(
                        Icons.pageview,
                        color: Colors.white,
                        size: 22,
                      ),
                      title: GestureDetector(
                        onTap: () {
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.DashboardClickedEvent);
                          onMenuItemClicked();
                        },
                        child: Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    // Grid View
                    ListTile(
                      leading: Icon(
                        Icons.grid_on,
                        color: Colors.white,
                        size: 22,
                      ),
                      title: GestureDetector(
                        onTap: () {
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.GridClickedEvent);
                          onMenuItemClicked();
                        },
                        child: Text(
                          'Grid Layout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    // List View
                    ListTile(
                      leading: Icon(
                        Icons.sort_by_alpha,
                        color: Colors.white,
                        size: 22,
                      ),
                      title: GestureDetector(
                        onTap: () {
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.ListClickedEvent);
                          onMenuItemClicked();
                        },
                        child: Text(
                          'List Layout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    //Recently View Artifacts
                    ListTile(
                      leading: Icon(
                        Icons.history,
                        color: Colors.white,
                        size: 22,
                      ),
                      title: GestureDetector(
                        onTap: () {
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.RecentlyViewedClickedEvent);
                          onMenuItemClicked();
                        },
                        child: Text(
                          'Recently Viewed',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    // About
                    // Horizontal line
                    Divider(
                      color: Colors.white,
                      thickness: 0.28,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        size: 22,
                      ),
                      title: GestureDetector(
                        onTap: () {
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.AboutClickedEvent);
                          onMenuItemClicked();
                        },
                        child: Text(
                          'About',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    // Help and Feedback
                    ListTile(
                      leading: Icon(
                        Icons.help_outline,
                        color: Colors.white,
                        size: 22,
                      ),
                      title: GestureDetector(
                        onTap: () {
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.HelpClickedEvent);
                          onMenuItemClicked();
                        },
                        child: Text(
                          'Help and Feedback',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
