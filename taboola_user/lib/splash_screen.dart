import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/local_storage/shared_prefernce_services.dart';
import 'package:taboola_user/routes.dart';
import 'package:taboola_user/ui/shared/widget/background_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<Splash> with SingleTickerProviderStateMixin {
  var _visible = true;
  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = const Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
  Navigator.of(context).popAndPushNamed((LocalStorageService().onBoarding??false)?Routes.home:Routes.onBoarding).then((value) {

  });
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(checkIfCenter: false,
        child: Stack(
          fit: StackFit.expand,
          children: [

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.fullLogoImage,
                  width: animation.value * 250,
                  height: animation.value * 250,
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
