import 'package:cdli_tablet_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:cdli_tablet_app/models/list_tile_model.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ListTileScreen extends StatefulWidget {
  final title;
  final image;
  final info;
  final thumbnail;
  final short_info;

  ListTileScreen(
      this.title, this.image, this.info, this.thumbnail, this.short_info);

  @override
  State<StatefulWidget> createState() {
    return _ListTileScreenState(
        this.title, this.image, this.info, this.thumbnail, this.short_info);
  }
}

class _ListTileScreenState extends State<ListTileScreen> {
  String title;
  String image;
  String info;
  String thumbnail;
  String short_info;

  _ListTileScreenState(
      this.title, this.image, this.info, this.thumbnail, this.short_info);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: kAppBarTitle,
        backgroundColor: Colors.black,
        leading: PlatformIconButton(
          android: (_) => MaterialIconButtonData(
              icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
          ios: (_) => CupertinoIconButtonData(
              icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )),
          onPressed: () => Navigator.of(context).pop(),
        ),
        //automaticallyImplyLeading: false,
      ),
      body: ListTileModel(title, image, info, thumbnail, short_info),
    );
  }
}
