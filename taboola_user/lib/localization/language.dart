import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:taboola_user/local_storage/shared_prefernce_services.dart';

class Language {
  static final PublishSubject<String> _language = PublishSubject<String>();

  final LocalStorageService _localStorageService =  LocalStorageService();
  Stream<String> get lang => _language.stream;


  void setLanguage(String language){
    //assert(language == null , "Error Set language because of null");

    //if(language != null){
      _localStorageService.language = language;
      _language.add(language);

  }
  String getLanguage(){
    if(_localStorageService.lang == null){
      _localStorageService.language = "en";
      return "en";
    }
    else{
      return _localStorageService.lang!;
    }
  }
}
TextDirection textDirection = TextDirection.LTR;