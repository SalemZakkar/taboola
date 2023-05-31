import 'package:flutter/material.dart';
import 'package:tabola_capten/generated/l10n.dart';

import 'package:tabola_capten/main_sdk/utils/location/location.dart';
import 'package:tabola_capten/ui/shared/widget/message.dart';

class ButtonTracker extends StatefulWidget {
  const ButtonTracker({Key? key}) : super(key: key);

  @override
  _ButtonTrackerState createState() => _ButtonTrackerState();
}

class _ButtonTrackerState extends State<ButtonTracker> {
  var isListen = !(locationService.serviceOn());
  @override
  Widget build(BuildContext context) {
 //   Size size = MediaQuery.of(context).size;
    return IconButton(
      onPressed: () async {
        if(isListen){
          if(await locationService.TrackMode(true)){
            setState(() {
              isListen = false;
            });
          }else{
            showSnack(S.of(context).check_gps_and_permissions, context);

          }
        }else{
          setState(() {
            isListen = true;
          });
          locationService.TrackMode(false);

        }

      },
      icon: (isListen ? Icon(Icons.location_pin , color: Theme.of(context).appBarTheme.iconTheme!.color,) : Icon(Icons.location_disabled , color: Theme.of(context).appBarTheme.iconTheme!.color,)),
    );
  }
}

