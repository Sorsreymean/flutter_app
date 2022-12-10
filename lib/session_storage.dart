

import 'package:universal_html/html.dart';
class SessionStorageHelper{
  static Storage sessionStorage = window.sessionStorage;
  static void savevalue(String key, String value){
    sessionStorage[key] = value;
  }
  static  getValue(String key){
    return sessionStorage[key];
  }
  static void removeValue(String key){
     sessionStorage.remove(key);
  }
  static void clearAll(){
    sessionStorage.clear();
  }
}