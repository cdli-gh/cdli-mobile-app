import 'package:cdli_tablet_app/services/cdli_data.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';


class CDLIDataState {
  List<CDLIData> list;
  bool loading;
  bool error;

  CDLIDataState({
    this.list = const [],
    this.loading = true,
    this.error = false,
  });

  void reset() {
    this.list = [];
    this.loading = true;
    this.error = false;
  }

  Future<void> getDataFromAPI() async {
    try {
      debugPrint('trying');
      var httpClient = new HttpClient();
      var request = await httpClient.getUrl(Uri.parse('https://cdli.ucla.edu/cdlitablet_android/fetchdata'));
      var response = await request.close();

      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        this.list = CdliData.fromJsonArray(json);

        this.loading = false;
        this.error = false;
      }
    } catch (exception) {
      print('error caught: $exception');
      this.list = [];
      this.loading = false;
      this.error = true;
    }
  }

  sortedList() {
    this.list.sort((a, b) {
      return a.fullTitle.toString().compareTo(b.fullTitle.toString());
    });
  }
}
