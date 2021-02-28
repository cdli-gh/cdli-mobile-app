import 'package:cdli_tablet_app/constants/close_screen.dart';
import 'package:cdli_tablet_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:cdli_tablet_app/models/grid_model.dart';
import 'package:cdli_tablet_app/routes/menu.dart';

class GridScreen extends StatelessWidget with NavigationState {
  final Function onMenuTap;
  const GridScreen({Key key, this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () {
        _onBackPressed(context);
        return;
      },

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
        ),
        body: GridModel(),
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
