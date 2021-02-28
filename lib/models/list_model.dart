import 'package:flutter/material.dart';
import 'package:cdli_tablet_app/services/cdli_data_state.dart';
import 'package:cdli_tablet_app/screens/list_tile_screen.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:cache_image/cache_image.dart';

class ListModel extends StatefulWidget {
  @override
  _ListModelState createState() => _ListModelState();
}

class _ListModelState extends State<ListModel> {
  final CdliDataState dataState = new CdliDataState();

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
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text(
        'Check your connection and try again.',
        style: TextStyle(
          fontFamily: 'NotoSansJP',
          fontWeight: FontWeight.w400,
        ),
      ),
      duration: new Duration(seconds: 3),
      action: new SnackBarAction(
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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                children: <Widget>[
                  Text('LIST LAYOUT',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontFamily: 'NotoSansJP',
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.sort_by_alpha,
                    color: Colors.white,
                    size: 22,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Artifacts sorted alphabetically',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: 'NotoSansJP',
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 0.28,
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: dataState.list.length,
                itemBuilder: (BuildContext context, int index) {
                  dataState.sortedList();
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(
                            dataState.list[index].fullTitle,
                            style: TextStyle(color: Colors.white, fontFamily: 'NotoSansJP', fontSize: 15),
                          ),
                          leading: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: 55,
                              minWidth: 55,
                              maxHeight: 75,
                              maxWidth: 75,
                            ),
                            child: Image(
                              image: CacheImage(dataState.list[index].url),
                              fit: BoxFit.fitWidth,
                              loadingBuilder: (context, child, progress) {
                                return progress == null
                                    ? child
                                    : new Center(
                                        child: PlatformCircularProgressIndicator(
                                        android: (_) => MaterialProgressIndicatorData(),
                                        ios: (_) => CupertinoProgressIndicatorData(radius: 25),
                                      ));
                              },
                            ),
                          ),
                          subtitle: Text(
                            date(index),
                            style: TextStyle(color: Colors.grey, fontFamily: 'NotoSansJP', fontSize: 14),
                          ),
                          onTap: () {
                            navigateToDetailScreen(
                              dataState.list[index].fullTitle,
                              dataState.list[index].url,
                              dataState.list[index].fullInfo,
                              dataState.list[index].thumbnailUrl,
                              dataState.list[index].blurb,
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToDetailScreen(String title, String image, String info, String thumbnail, String shortInfo) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => ListTileScreen(title, image, info, thumbnail, shortInfo)));
  }

  date(int index) {
    String m;

    var day = DateTime.parse(dataState.list[index].date).day;
    var month = DateTime.parse(dataState.list[index].date).month;
    var year = DateTime.parse(dataState.list[index].date).year;

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
