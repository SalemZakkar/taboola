import 'package:rxdart/rxdart.dart';
import 'package:tabola_capten/local_storage/shared_prefernce_services.dart';

class Localize {
  final PublishSubject<String> lang = PublishSubject<String>();

  final LocalStorageService _localStorageService =  LocalStorageService();

  static String english = "en";
  static String arabic = "ar";
  void setLanguage(String language){
    _localStorageService.lang = language;
    lang.add(language);
  }
  String getLanguage(){
    if(_localStorageService.lang == null){
      _localStorageService.lang = english;
      return english;
    }
    else{
      return _localStorageService.lang!;
    }
  }
}
Localize localize = Localize();