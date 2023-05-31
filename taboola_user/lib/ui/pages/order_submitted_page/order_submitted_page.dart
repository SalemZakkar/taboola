import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/routes.dart';
import 'package:taboola_user/ui/shared/widget/custom_button.dart';

class OrderSubmittedPage extends StatefulWidget {
  const OrderSubmittedPage({Key? key}) : super(key: key);

  @override
  _OrderSubmittedPageState createState() => _OrderSubmittedPageState();
}

class _OrderSubmittedPageState extends State<OrderSubmittedPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height,
          color: Theme.of(context).backgroundColor,
        ),
        Image.asset(Assets.backgroundImage , width: size.width, height: size.height,fit: BoxFit.fill,),
        Scaffold(
          appBar: AppBar(
            title: Image.asset(Assets.logoImage , width: 100,),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                children: [
                  Image.asset(
                    Assets.fullLogoImage,
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(height: 50.0,),
                  const Text("YOUR ORDER HAS\nBEEN SUBMITTED!" , style: TextStyle(color: AppColors.kPrimaryRedColor , fontWeight: FontWeight.bold,fontSize: 16.0),textAlign: TextAlign.center,),
                  const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Text("Nulla elementum hendrerit velit vitae consectetur.Praesent vulputate dui eget semper posuere. Duis elit mi, dapibus eget nisl nec, congue gravida ante.Aenean consectetur erat. " , style: TextStyle(color: AppColors.kPrimaryGrayColor, fontSize: 12.0),),
                  ),
                  CustomButton(text: "Go Back Home",height: 45.0,width: 200.0,color: AppColors.kPrimaryGreenColor,onTap: (){Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);},)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
