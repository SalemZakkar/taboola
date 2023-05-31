import 'package:flutter/material.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/ui/pages/points_page/points_widgets/point_card.dart';

class ViewAllPointsPage extends StatefulWidget {
  const ViewAllPointsPage({Key? key}) : super(key: key);

  @override
  _ViewAllPointsPageState createState() => _ViewAllPointsPageState();
}

class _ViewAllPointsPageState extends State<ViewAllPointsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
           color:  Theme.of(context).backgroundColor
        ),
        Image.asset(Assets.backgroundImage , width: size.width,height: size.height, fit: BoxFit.fill,),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Image.asset(Assets.logoImage , width: 100,),
            centerTitle: true,
            elevation: 0,
          ),
          body: Container(
            padding: const EdgeInsets.all(10),
            constraints: const BoxConstraints.expand(),
            color: Colors.transparent,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 50,
              itemBuilder: (context , index){
                return pointCard(size);
              },
            )
          ),
        )
      ],
    );
  }
}
