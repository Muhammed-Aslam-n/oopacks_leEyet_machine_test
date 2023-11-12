
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';

class SharedPreferenceHelper{

  SharedPreferenceHelper._();

  // Singleton instance
  static final SharedPreferenceHelper _instance = SharedPreferenceHelper._();
  // Factory constructor to provide access to the singleton instance
  factory SharedPreferenceHelper() {
    return _instance;
  }

  static const _darkThemeKey = 'appDarkTheme';
  static const _userLogStateKey = 'UserLogState';

  static Future<bool> saveAppTheme(AppThemes appTheme )async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    final bool res = await pref.setInt(_darkThemeKey, appTheme==AppThemes.darkTheme?1:0);
    debugPrint('savedAppTheme $appTheme');
    return res;
  }

  static Future<AppThemes?> getAppTheme()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    final AppThemes? res = pref.getInt(_darkThemeKey,)==1?AppThemes.darkTheme:AppThemes.lightTheme;
    debugPrint('fetchedAppTheme $res');
    return AppThemes.darkTheme;
  }

 static Future<bool?> setUserLoggedIn()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    final bool? launchState = await pref.setBool(_userLogStateKey,true);
    debugPrint('setUserLoggedIn SUCCESS');
    return launchState;
  }
  static Future<bool?> clearUserLoggedIn()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    final bool? launchState = await pref.setBool(_userLogStateKey,false);
    debugPrint('setUserLoggedIn SUCCESS');
    return launchState;
  }

 static Future<bool?> isUserLoggedIn()async{
   debugPrint('fetchedAppLaunchState');
    SharedPreferences pref = await SharedPreferences.getInstance();
    final bool? launchState = pref.getBool(_userLogStateKey);
    debugPrint('fetchedAppLaunchState $launchState');
    return launchState;
  }

}