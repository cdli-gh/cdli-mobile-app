import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// To close the App
Widget closeApp(BuildContext context) {
  return AlertDialog(
    title: Text(
      'cdli tablet',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontFamily: 'NotoSansJP',
        fontWeight: FontWeight.w400,
      ),
    ),
    content: SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          Text(
            'Do you really want to exit?',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'NotoSansJP',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ),
    actions: <Widget>[
      TextButton(
        child: Text(
          'Yes',
          style: TextStyle(
            color: Colors.lightBlue,
            fontSize: 15,
            fontFamily: 'NotoSansJP',
            fontWeight: FontWeight.w400,
          ),
        ),
        onPressed: () {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        },
      ),
      TextButton(
        child: Text(
          'No',
          style: TextStyle(
            color: Colors.lightBlue,
            fontSize: 15,
            fontFamily: 'NotoSansJP',
            fontWeight: FontWeight.w400,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}
