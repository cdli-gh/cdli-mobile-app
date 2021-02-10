import 'package:cdli_tablet_app/services/cdli_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecentlyViewedState {
  static SharedPreferences _pref;

  static Future<List<CdliData>> getLastViewedItems(List<CdliData> originalItems) async {
    _pref = await SharedPreferences.getInstance();
    List<String> viewedItemIds = _pref.getStringList('last-viewed') ?? [];
    List lastViewedItems = viewedItemIds.map((title) => originalItems.firstWhere((item) => item.fullTitle == title)).toList();
    return lastViewedItems;
  }

  static void addItemToViewHistory(String title) async {
    _pref = await SharedPreferences.getInstance();
    List<String> viewedItemIds = _pref.getStringList('last-viewed') ?? [];
    if (viewedItemIds.contains(title)) {
      viewedItemIds.removeWhere((itemTitle) => itemTitle == title);
    }
    if (viewedItemIds.length == 10) {
      viewedItemIds.removeLast();
    }
    viewedItemIds.insert(0, title);
    _pref.setStringList('last-viewed', viewedItemIds);
  }
}
