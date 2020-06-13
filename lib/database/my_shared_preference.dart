import 'package:shared_preferences/shared_preferences.dart';

final String KEY = 'JSON_DATA';

Future<SharedPreferences> getSharedPreference() async {
 return await SharedPreferences.getInstance();
}

Future<void> setString(String data) async {
 final sharedPreference = await getSharedPreference();
 sharedPreference.setString(KEY, data);
}
