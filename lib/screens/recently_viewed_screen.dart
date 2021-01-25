import 'package:flutter/material.dart';

import 'package:cdli_tablet_app/routes/menu.dart';
import 'package:cdli_tablet_app/models/recently_viewed_model.dart';

class RecentlyViewedScreen extends StatelessWidget with NavigationState {
  final Function onMenuTap;
  const RecentlyViewedScreen({Key key, this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'cdli tablet',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'NotoSansJP',
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Colors.black,
        leading: InkWell(
          child: Icon(Icons.menu, color: Colors.white),
          onTap: onMenuTap,
        ),
      ),
      body: Column(
        children: [
          header(),
          Expanded(
            flex: 1,
            child: RecentlyViewedModel(),
          ),
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              children: <Widget>[
                Text(
                  'RECENTLY VIEWED ARTIFACTS',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    fontFamily: 'NotoSansJP',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.history,
                  color: Colors.white,
                  size: 22,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Artifacts sorted by last viewed',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'NotoSansJP',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.white,
            thickness: 0.28,
          ),
        ],
      ),
    );
  }
}
