
import 'dart:async';

import 'package:permission_handler/permission_handler.dart';
import 'package:tabola_capten/local_storage/shared_prefernce_services.dart';
import 'package:tabola_capten/main_sdk/models/order_paging_model.dart';
import 'package:tabola_capten/main_sdk/servisec/identity/order_identity_apis.dart';
import 'package:location/location.dart' as loc;

class LocationService {
  var service = loc.Location.instance;
  LocalStorageService localStorageService = LocalStorageService();
  StreamSubscription? streamSubscription;
  Future<bool> servicesEnable() async {
    PermissionStatus res1 = await Permission.locationAlways.request();
    bool res2 = await loc.Location.instance.requestService();
    if((res1.isGranted) && res2){
      print('Systems initialized -------------------------------------------------------------------------------------------->');
      return true;
    }else{
      print('Systems is uninitialized ---------------------------------------------------------------------------------------->');
      return false;
    }
  }
  Future<bool> TrackMode(bool value) async {
    if(value){
      if(await servicesEnable()){
        localStorageService.location = value;
        service.changeSettings(distanceFilter: 5);
        service.changeNotificationOptions(
          //color: AppColors.kPrimaryGreenColor,
          title: 'Taboola Delivery',
          subtitle: 'Listening to Location',
          channelName: 'Taboola Location Info',
            iconName: '@mipmap/ic_launcher',
        );
        streamSubscription = service.onLocationChanged.listen((event) {
          try{
            OrderIdentityApi().updateLocationWithToken(Results(
                lang: event.longitude.toString()
                , lat: event.latitude.toString()
            ),
                localStorageService.token ?? "n/a");
            print("Send Data Successfully");
            print("lat: ${event.latitude.toString()} ---" "long: ${event.longitude.toString()} ---" "token: ${localStorageService.token}");
          }catch(e){
            print(e.toString());
          }

        });
        service.enableBackgroundMode(enable: true);
        return true;
      }else{
        return false;
      }
    }
    else {
      localStorageService.location = false;
      service.enableBackgroundMode(enable: false);
      if(streamSubscription != null){
        streamSubscription!.cancel();
      }
      service = loc.Location.instance;
      return false;
    }
  }
  bool serviceOn(){
    return localStorageService.location ?? false;
  }
}
LocationService locationService = LocationService();