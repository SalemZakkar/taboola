import 'package:flutter/material.dart';
import '/constants/assets.dart';


class BackgroundScreen extends StatefulWidget {
  final Widget child;
  final bool checkIfCenter;
  const BackgroundScreen({Key? key , required this.child , this.checkIfCenter=false}) : super(key: key);

  @override
  _BackgroundScreenState createState() => _BackgroundScreenState();
}

class _BackgroundScreenState extends State<BackgroundScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:widget.checkIfCenter? Alignment.center:null ,
      constraints: const BoxConstraints.expand(),
      decoration:  const BoxDecoration(
          image:  DecorationImage(
              image: AssetImage(Assets.backgroundImage), fit: BoxFit.cover)),
      child: widget.child,
    );
  }
}
