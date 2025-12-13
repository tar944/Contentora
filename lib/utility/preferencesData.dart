import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  late SharedPreferences prefs;

  Future<void> setLanguage(String token) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('lang', token);
  }

  Future<String> getLanguage()async{
    prefs = await SharedPreferences.getInstance();
    return prefs.getString('lang') ?? "fa";
  }
}
