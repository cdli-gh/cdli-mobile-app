import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cdli_tablet_app/services/cdli_data_state.dart';
import 'package:cdli_tablet_app/screens/list_tile_screen.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SearchModel extends StatefulWidget {
  @override
  _SearchModelState createState() => _SearchModelState();
}

class _SearchModelState extends State<SearchModel> {
  final CDLIDataState dataState = new CDLIDataState();
  CDLIDataState dataStateSearch = new CDLIDataState();

  @override
  void initState() {
    super.initState();
    getDataFromApi();
    dataStateSearch.list = dataState.list;
  }

  getDataFromApi() async {
    if (!mounted) return;
    await dataState.getDataFromAPI();
    print('dataState is ');
    print(dataState.list);
    setState(() {
      if (dataState.error) {
        _showError();
      }
    });
  }

  void _retry() {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    dataState.reset();
    setState(() {});
    getDataFromApi();
  }

  void _showError() {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text('Check your connection and try again.'),
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
    return ListView.builder(
        itemCount: dataStateSearch.list.length + 1,
        itemBuilder: (BuildContext context, int index) {
          return index == 0 ? searchBar() : listTiles(index - 1);
        });
  }

  searchBar() {
    return Padding(
        padding: const EdgeInsets.only(top: 14.0, right: 8.0, left: 8.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontFamily: 'NotoSansJP',
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: Icon(Icons.search, color: Colors.white),
            enabledBorder: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(16.0),
              borderSide: new BorderSide(color: Colors.grey),
            ),
          ),
          style: TextStyle(color: Colors.white),
          onChanged: (text) {
            text = text.toLowerCase();
            setState(() {
              dataStateSearch.list = dataState.list.where((dataState) {
                var dataStateTitle = dataState.fullTitle.toLowerCase();
                return dataStateTitle.contains(text);
              }).toList();
            });
          },
        ));
  }

  listTiles(index) {
    return Card(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            dataStateSearch.list[index].fullTitle,
            style: TextStyle(
                color: Colors.white, fontFamily: 'NotoSansJP', fontSize: 15),
          ),
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 55,
              minWidth: 55,
              maxHeight: 75,
              maxWidth: 75,
            ),
            child: Image(
              image: CachedNetworkImage(
                imageUrl: dataState.list[index].url,
              ) as ImageProvider,
              fit: BoxFit.fitWidth,
              loadingBuilder: (context, child, progress) {
                return progress == null
                    ? child
                    : new Center(
                        child: PlatformCircularProgressIndicator(
                        material: (_, __) => MaterialProgressIndicatorData(),
                        cupertino: (_, __) =>
                            CupertinoProgressIndicatorData(radius: 25),
                      ));
              },
            ),
          ),
          subtitle: Text(
            date(index),
            style: TextStyle(
                color: Colors.grey, fontFamily: 'NotoSansJP', fontSize: 14),
          ),
          onTap: () {
            navigateToDetailScreen(
              dataStateSearch.list[index].fullTitle,
              dataStateSearch.list[index].url,
              dataStateSearch.list[index].fullInfo,
              dataStateSearch.list[index].thumbnailUrl,
              dataStateSearch.list[index].blurb,
            );
          },
        ),
      ),
    );
  }

  void navigateToDetailScreen(String title, String image, String info,
      String thumbnail, String shortInfo) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ListTileScreen(title, image, info, thumbnail, shortInfo)));
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
