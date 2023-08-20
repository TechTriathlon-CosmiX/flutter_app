import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends GetxService {
  final RxString username = ''.obs;
  final RxBool isAuthenticated = false.obs;

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    username.value = _prefs?.getString('username') ?? '';
    isAuthenticated.value = _prefs?.getBool('isAuthenticated') ?? false;
  }

  void setUser(String newUsername) {
    username.value = newUsername;
    _prefs?.setString('username', newUsername);
  }

  void setAuthentication(bool value) {
    isAuthenticated.value = value;
    _prefs?.setBool('isAuthenticated', value);
  }
}
