import 'package:flutter/material.dart';

class AboutModel extends StatefulWidget {
  @override
  _AboutModelState createState() => _AboutModelState();
}

class _AboutModelState extends State<AboutModel> {
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
                  Text('ABOUT', style: TextStyle(color: Colors.grey, fontSize: 17, fontFamily: 'NotoSansJP',
                    fontWeight: FontWeight.w400,)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.info_outline, color: Colors.white, size: 22,),
                  SizedBox(width: 10,),
                  Text('Cuneiform Digital Library Initiative', style: TextStyle(color: Colors.white, fontSize: 17, fontFamily: 'NotoSansJP',
                    fontWeight: FontWeight.w400,)),
                ],
              ),
            ),
            Divider(color: Colors.white, thickness: 0.28,),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: <Widget>[
                      Text('This app curates highlighted objects from the CDLI collection. '
                          'Entries are written by experts in the field. New highlights are available '
                          'each day, and links are included to find more information on the CDLI website. ',
                          style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'NotoSansJP',
                                  fontWeight: FontWeight.w400,)),
                      SizedBox(
                        height: 15,
                      ),
                      Text('You can share entries via social media if you want to show a particular object '
                          'to others. Any feedback should be submitted via the menu in the navigation menu on the left.',
                          style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w400,)),
                    ],
                  ),
                        ),
                      ),
                    ),
          ]),
      ),
    );
  }
}
