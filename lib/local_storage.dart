

import 'package:universal_html/html.dart';
class LocalStorageHelper{
  static Storage localStorage = window.localStorage;
  static void savevalue(String key, String value){
    localStorage[key] = value;
  }
  static  getValue(String key){
    return localStorage[key];
  }
  static void removeValue(String key){
     localStorage.remove(key);
  }
  static void clearAll(){
    localStorage.clear();
  }
}