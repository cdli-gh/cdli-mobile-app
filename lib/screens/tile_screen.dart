import 'package:cdli_tablet_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:cdli_tablet_app/models/tile_model.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class TileScreen extends StatefulWidget {
  final position;

  TileScreen(this.position);

  @override
  State<StatefulWidget> createState() {
    return _TileScreenState(this.position);
  }
}

class _TileScreenState extends State<TileScreen> {
  int position;

  _TileScreenState(this.position);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: kAppBarTitle,
        backgroundColor: Colors.black,
        leading: PlatformIconButton(
          material: (_, __) => MaterialIconButtonData(
              icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
          cupertino: (_, __) => CupertinoIconButtonData(
              icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )),
          onPressed: () => Navigator.of(context).pop(),
        ),
        //automaticallyImplyLeading: false,
      ),
      body: TileModel(position),
    );
  }
}
