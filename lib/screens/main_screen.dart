import 'package:cdli_tablet_app/constants/close_screen.dart';
import 'package:cdli_tablet_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:cdli_tablet_app/models/main_model.dart';
import 'package:cdli_tablet_app/screens/search_screen.dart';
import 'package:cdli_tablet_app/routes/menu.dart';

class MainScreen extends StatelessWidget with NavigationState {
  final Function onMenuTap;

  const MainScreen({Key key, this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: kAppBarTitle,
          backgroundColor: Colors.black,
          leading: InkWell(
            child: Icon(Icons.menu, color: Colors.white),
            onTap: onMenuTap,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              tooltip: 'Search',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
            ),
          ],
        ),
        body: MainModel(),
      ),
    );
  }

  Future<bool> _onBackPressed(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return closeApp(context);
      },
    );
  }
}
