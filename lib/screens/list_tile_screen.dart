import 'package:cdli_tablet_app/constants/constants.dart';
import 'package:cdli_tablet_app/services/recently_viewed_state.dart';
import 'package:flutter/material.dart';
import 'package:cdli_tablet_app/models/list_tile_model.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ListTileScreen extends StatefulWidget {
  final title;
  final image;
  final info;
  final thumbnail;
  final shortInfo;

  ListTileScreen(
      this.title, this.image, this.info, this.thumbnail, this.shortInfo);

  @override
  State<StatefulWidget> createState() {
    return _ListTileScreenState(
        this.title, this.image, this.info, this.thumbnail, this.shortInfo);
  }
}

class _ListTileScreenState extends State<ListTileScreen> {
  String title;
  String image;
  String info;
  String thumbnail;
  String shortInfo;

  _ListTileScreenState(
      this.title, this.image, this.info, this.thumbnail, this.shortInfo);

  @override
  void initState() {
    RecentlyViewedState.addItemToViewHistory(title);
    super.initState();
  }

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
      body: ListTileModel(title, image, info, thumbnail, shortInfo),
    );
  }
}
