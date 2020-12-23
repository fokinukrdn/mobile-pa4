import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModel extends ChangeNotifier {

  var woWeekend;
  var isActiveDiscount = false;
  var discount = 0.0;


  activateCookies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('woWeekend', woWeekend);
    print(prefs.getBool('woWeekend'));
  }

  activateWoweekend()  {
    woWeekend = !woWeekend;
    activateCookies().then((a) {
      notifyListeners();});
  }

  activateDiscount(var newDiscount) {
      discount = newDiscount;
      isActiveDiscount = !isActiveDiscount;
      notifyListeners();
  }


}