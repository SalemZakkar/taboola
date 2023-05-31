import 'package:flutter/material.dart';
import 'package:taboola_user/local_storage/shared_prefernce_services.dart';
import 'package:taboola_user/routes.dart';
import '/constants/app_theme.dart';
import '/constants/assets.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryLightColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 225.0,
              child: Stack(
                children: [
                  Container(
                      height: 170.0,
                      decoration: const BoxDecoration(
                          color: AppColors.kPrimaryGreenColor,
                          image: DecorationImage(
                              image: AssetImage(Assets.backgroundImage),
                              fit: BoxFit.cover))),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: const BoxDecoration(
                          color: AppColors.kPrimaryLightColor,
                          shape: BoxShape.circle),
                      child: Center(
                        child: Image.asset(
                          Assets.fullLogoImage,
                          height: 125,
                          width: 150,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            const Text(
              "Food Delivery",
              style: TextStyle(
                  color: AppColors.kPrimaryRedColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25.0,
            ),
            const Text(
              "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, \nsed do eiusmod tempor\nincididunt ut labore et dolore\nmagna aliqua. ",
              style: TextStyle(
                  color: AppColors.kPrimaryGreenBlackColor1,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25.0,
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: (){
                Navigator.pushNamed(context, Routes.loginUser);
              },
              child: Container(
                height: 45.0,
                decoration: BoxDecoration(
                  color: AppColors.kPrimaryRedColor,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kPrimaryBlackColor.withOpacity(0.15),
                      spreadRadius: 1.0,
                      blurRadius: 1.0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                margin:const EdgeInsets.only(left: 30.0 , top: 10.0 , right: 30.0),
                child: const Center(child: Text("LogIn" , style: TextStyle(color: AppColors.kPrimaryBodyColor ,fontWeight: FontWeight.bold ,fontSize: 18.0 ),)),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: (){
                Navigator.pushNamed(context, Routes.signUpUser);
              },
              child: Container(
                height: 45.0,
                decoration: BoxDecoration(
                  color: AppColors.kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: AppColors.kPrimaryRedColor , width: 2.0),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kPrimaryBlackColor.withOpacity(0.15),
                      spreadRadius: 1.0,
                      blurRadius: 1.0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                margin:const EdgeInsets.only(left: 30.0 , top: 10.0 , right: 30.0),
                child: const Center(child: Text("Sign up" , style: TextStyle(color: AppColors.kPrimaryRedColor ,fontWeight: FontWeight.bold ,fontSize: 18.0 ),)),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            InkWell(
              onTap: (){
                LocalStorageService().onBoarding = true;
                Navigator.of(context).pushNamedAndRemoveUntil(Routes.home, (route) => false);
              },
              child: Text("skip" , style: TextStyle(fontSize: 15.0 , color: AppColors.kPrimaryGrayColor , decoration: TextDecoration.underline),),
            )
          ],
        ),
      ),
    );
  }
}
