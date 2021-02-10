import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cdli_tablet_app/services/cdli_data_state.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HighlightsModel extends StatefulWidget {
  @override
  _HighlightsModelState createState() => _HighlightsModelState();
}

class _HighlightsModelState extends State<HighlightsModel> {
  static CdliDataState dataState = new CdliDataState();

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

  int _current = 0;
  List highlights = [
    'assets/highlights/highlight-01.jpg',
    'assets/highlights/highlight-02.jpg',
    'assets/highlights/highlight-03.jpg',
    'assets/highlights/highlight-04.jpg',
    'assets/highlights/highlight-05.jpg',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    double height = MediaQuery.of(context).size.height - padding.top - padding.bottom;
    return Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
      CarouselSlider(
        height: height - 150,
        initialPage: 0,
        // enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration: Duration(milliseconds: 2000),
        pauseAutoPlayOnTouch: Duration(seconds: 10),
        onPageChanged: (index) {
          setState(() {
            _current = index;
          });
        },
        items: highlights.map((imgAsset) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Image.asset(
                  imgAsset, fit: BoxFit.fitWidth,
                  //loadingBuilder: progressIndicator(),
                ),
              );
            },
          );
        }).toList(),
      ),
      SizedBox(
        height: 30,
      ),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(highlights, (index, asset) {
            return Container(
              width: 7.0,
              height: 7.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
              decoration: BoxDecoration(shape: BoxShape.circle, color: _current == index ? Colors.white : Colors.grey),
            );
          })),
    ]));
  }
}
