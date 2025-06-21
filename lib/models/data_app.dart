import 'package:flutter/cupertino.dart';
import 'package:top_academy/component/group_item.dart';

import '../component/event_list.dart';

class DataApp {
  static GroupItem? _groupItem;
  static late DateTime _date;
  static int filialId = 1;

  static DateTime get date {return _date;}
  static set date(DateTime value) {
    DataApp._date = value;
    eventsKey.currentState?.loadEvents();
  }

  static GroupItem? get groupItem {return _groupItem;}
  static set groupItem(GroupItem? value) {
    DataApp._groupItem = value;
    eventsKey.currentState?.loadEvents();
  }

  static GlobalKey<EventListState> eventsKey = GlobalKey<EventListState>();
}
