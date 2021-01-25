import 'package:cdli_tablet_app/services/recently_viewed_state.dart';
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
  void initState() {
    RecentlyViewedState.addItemToViewHistory(title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'cdli tablet',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'NotoSansJP',
            fontWeight: FontWeight.w400,
          ),
        ),
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
