import 'package:cdli_tablet_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:cdli_tablet_app/models/highlights_model.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class HighlightsScreen extends StatefulWidget {
  @override
  _HighlightsScreenState createState() => _HighlightsScreenState();
}

class _HighlightsScreenState extends State<HighlightsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
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
      ),
      body: HighlightsModel(),
    );
  }
}
