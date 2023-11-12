import 'package:flutter/material.dart';
import '../../utils/shared_preference_helper.dart';

class LaunchProvider extends ChangeNotifier {

  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Future<void> checkUserLoggedIn() async {
    final bool? loggedIn = await SharedPreferenceHelper.isUserLoggedIn();
    debugPrint('loggedIn?? $loggedIn');
    if (loggedIn != null && loggedIn) {
      _isLoggedIn = true;
    } else {
      _isLoggedIn = false;
    }
    notifyListeners();
  }
}
