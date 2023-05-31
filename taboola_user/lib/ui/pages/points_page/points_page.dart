import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/routes.dart';
import 'package:taboola_user/ui/pages/points_page/points_widgets/point_card.dart';

class PointsPage extends StatefulWidget {
  const PointsPage({Key? key}) : super(key: key);

  @override
  _PointsPageState createState() => _PointsPageState();
}

class _PointsPageState extends State<PointsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
            color: Theme.of(context).backgroundColor
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
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(Assets.fullLogoImage,width: 150,),
                  SizedBox(height: 10,),
                  pointCard(size),
                  pointCard(size),
                  pointCard(size),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, Routes.viewAllPoints);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: size.width*0.4,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.kPrimaryGreenColor,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Text(S.of(context).view , textScaleFactor: 0.8,style: TextStyle(color: AppColors.kPrimaryBodyColor),),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(S.of(context).total + " "+ S.of(context).myPoints , textScaleFactor: 1.2,style: TextStyle(color: AppColors.kPrimaryRedColor , shadows: [Shadow(color: AppColors.kPrimaryGrayColor,blurRadius: 2)]),),
                  const Text("5000" , textScaleFactor: 1.2,style: TextStyle(color: AppColors.kPrimaryRedColor , shadows: [Shadow(color: AppColors.kPrimaryGrayColor,blurRadius: 2)]),),
                  const SizedBox(height: 15,),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child:  Text("Learn More About Our Points System" , textScaleFactor: 1.2,style: TextStyle(color: AppColors.kPrimaryGreenColor),),
                  ),
                  const SizedBox(height: 15,),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child:  Text("Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life," , textScaleFactor: 1,style: TextStyle(color: AppColors.kPrimaryGrayColor),),
                  ),
                  const SizedBox(height: 15,),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child:  Text("Want More Points Order now? order now" , textScaleFactor: 1,style: TextStyle(color: AppColors.kPrimaryRedColor),),
                  ),
                  const SizedBox(height: 15,),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child:  Text("Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life,Fuck this Fucking Life," , textScaleFactor: 1,style: TextStyle(color: AppColors.kPrimaryGrayColor),),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
