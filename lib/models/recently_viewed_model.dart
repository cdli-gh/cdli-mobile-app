import 'package:cache_image/cache_image.dart';
import 'package:cdli_tablet_app/screens/list_tile_screen.dart';
import 'package:cdli_tablet_app/services/cdli_data.dart';
import 'package:cdli_tablet_app/services/cdli_data_state.dart';
import 'package:cdli_tablet_app/services/recently_viewed_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class RecentlyViewedModel extends StatefulWidget {
  @override
  _RecentlyViewedModelState createState() => _RecentlyViewedModelState();
}

class _RecentlyViewedModelState extends State<RecentlyViewedModel> {
  final cdliDataState dataState = new cdliDataState();

  @override
  void initState() {
    super.initState();
    getDataFromApi();
  }

  getDataFromApi() async {
    if (!mounted) return;
    await dataState.getDataFromAPI();
    setState(() {
      if (dataState.error) {
        _showError();
      }
    });
  }

  void _retry() {
    Scaffold.of(context).removeCurrentSnackBar();
    dataState.reset();
    setState(() {});
    getDataFromApi();
  }

  void _showError() {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        'Check your connection and try again.',
        style: TextStyle(
          fontFamily: 'NotoSansJP',
          fontWeight: FontWeight.w400,
        ),
      ),
      duration: Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Retry',
        textColor: Colors.cyan,
        onPressed: () {
          _retry();
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<cdliData>>(
        future: RecentlyViewedState.getLastViewedItems(dataState.list),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            return Container();
          }
          List<cdliData> recentlyViewedItems = snapshot.data;
          return ListView.builder(
            itemBuilder: (ctx, index) =>
                customListItem(recentlyViewedItems[index]),
            itemCount: recentlyViewedItems.length,
          );
        },
      ),
    );
  }

  Widget customListItem(cdliData item) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              item.full_title,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'NotoSansJP',
                fontSize: 15,
              ),
            ),
            leading: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 55,
                minWidth: 55,
                maxHeight: 75,
                maxWidth: 75,
              ),
              child: Image(
                image: CacheImage(item.url),
                fit: BoxFit.fitWidth,
                loadingBuilder: (context, child, progress) {
                  return progress == null
                      ? child
                      : new Center(
                          child: PlatformCircularProgressIndicator(
                            android: (_) => MaterialProgressIndicatorData(),
                            ios: (_) => CupertinoProgressIndicatorData(
                              radius: 25,
                            ),
                          ),
                        );
                },
              ),
            ),
            subtitle: Text(
              date(item),
              style: TextStyle(
                  color: Colors.grey, fontFamily: 'NotoSansJP', fontSize: 14),
            ),
            onTap: () {
              navigateToDetailScreen(
                item.full_title,
                item.url,
                item.full_info,
                item.thumbnail_url,
                item.blurb,
              );
            },
          ),
        ),
      ),
    );
  }

  void navigateToDetailScreen(String title, String image, String info,
      String thumbnail, String short_info) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ListTileScreen(title, image, info, thumbnail, short_info),
      ),
    );
  }

  date(cdliData item) {
    String m;

    var day = DateTime.parse(item.date).day;
    var month = DateTime.parse(item.date).month;
    var year = DateTime.parse(item.date).year;

    switch (month) {
      case 1:
        {
          m = 'January';
        }
        break;
      case 2:
        {
          m = 'February';
        }
        break;
      case 3:
        {
          m = 'March';
        }
        break;
      case 4:
        {
          m = 'April';
        }
        break;
      case 5:
        {
          m = 'May';
        }
        break;
      case 6:
        {
          m = 'June';
        }
        break;
      case 7:
        {
          m = 'July';
        }
        break;
      case 8:
        {
          m = 'August';
        }
        break;
      case 9:
        {
          m = 'September';
        }
        break;
      case 10:
        {
          m = 'October';
        }
        break;
      case 11:
        {
          m = 'November';
        }
        break;
      case 12:
        {
          m = 'December';
        }
        break;
      default:
        {
          m = 'January';
        }
        break;
    }

    return m + " " + day.toString() + ", " + year.toString();
  }
}
