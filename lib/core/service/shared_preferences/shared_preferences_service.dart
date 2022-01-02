import 'package:flutter_architecture_template/core/base/enum/preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  static final SharedPreferenceService sharedPreferenceService =
      SharedPreferenceService._init();

  SharedPreferences? _prefs;
  static SharedPreferenceService get instance => sharedPreferenceService;

  SharedPreferenceService._init() {
    SharedPreferences.getInstance().then((value) => _prefs = value);
  }

  static Future prefrencesInit() async {
    instance._prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _prefs!.setString(key.toString(), value);
  }

  Future clearToken() async {
    await _prefs!.clear();
  }

  int daysBetween(DateTime from) {
    from = DateTime(from.year, from.month, from.day, from.hour, from.minute,
        from.millisecond);
    DateTime to = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        DateTime.now().hour + 3,
        DateTime.now().minute,
        DateTime.now().millisecond);
    return to.difference(from).inSeconds;
  }

  bool get tokenIsActive => this.daysBetween(DateTime.parse(
              this.getStringValue(PreferencesKeys.EXPIRATION)!)) <
          0
      ? true
      : false;

  String? getStringValue(PreferencesKeys key) {
    var aa =
        _prefs != null ? (_prefs!.getString(key.toString()) ?? null) : null;
    return aa;
  }
}
