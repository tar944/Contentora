import 'package:contentora/utility/preferencesData.dart';
import 'package:flutter/foundation.dart';

class GlobalDataModel extends ChangeNotifier {
  String _lang = '';

  String get lang => _lang;


  GlobalDataModel(){
    loadData();
  }

  Future<void> loadData() async {
    _lang = await Preference().getLanguage();
    notifyListeners();
  }

  void setLanguage(String lang) {
    _lang=lang;
    notifyListeners(); // notify all widgets listening to this model
  }
}
