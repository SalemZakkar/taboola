import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main.dart';
import 'package:taboola_user/ui/shared/widget/custom_button.dart';

class ExtraNotesPage extends StatefulWidget {
  const ExtraNotesPage({Key? key}) : super(key: key);

  @override
  _ExtraNotesPageState createState() => _ExtraNotesPageState();
}

class _ExtraNotesPageState extends State<ExtraNotesPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        var focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus) {
          focus.unfocus();
        }
      },
      child: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            color: Theme.of(context).backgroundColor,
          ),
          Image.asset(Assets.backgroundImage , width: size.width,height: size.height,fit: BoxFit.fill,),
          Scaffold(
            //backgroundColor: AppColors.kPrimaryBodyColor,
            appBar: AppBar(
              title: Text(S.of(context).extraNotes),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 30.0, top: 20.0 , bottom: 25.0,right: 30),
                      alignment: (activeLanguage == "en" ? Alignment.bottomLeft : Alignment.bottomRight),
                      child:  Text(
                        S.of(context).extraNotes,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.bodyText1?.color),
                      )),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 30.0,
                    itemPadding:const EdgeInsets.only( bottom: 20.0),
                    itemBuilder: (context, _) =>const Icon(
                      Icons.star,
                      color: AppColors.kPrimaryRedColor,
                    ),
                    onRatingUpdate: (rating) {
                    },
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 30.0, top: 20.0 ),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "todo add ui for checkBox ",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kPrimaryRedColor , fontStyle: FontStyle.italic),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0 , right: 20.0),
                    child: Divider(color: AppColors.kPrimaryGrayColor.withOpacity(0.8),thickness: 0.5,),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 30.0, top: 20.0 , bottom: 25.0 , right: 30),
                      alignment: (activeLanguage == "en" ? Alignment.bottomLeft : Alignment.bottomRight),
                      child:  Text(
                        S.of(context).items_review,
                        style:  TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.bodyText1?.color),
                      )),
                  Container(
                      margin: const EdgeInsets.only(left: 30.0, top: 20.0 , bottom: 25.0),
                      padding: const EdgeInsets.all(5),
                      width: 170,
                      height: 80,
                      color: AppColors.kPrimaryLightColor,
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child:ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.asset(
                                    Assets.girlImage,
                                    width: 50.0,
                                    height: 50.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Text(
                                "Items Review",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.kPrimaryGreenBlackColor1),
                              ),
                            ],
                          ),
                          const Icon(Icons.favorite , color: AppColors.kPrimaryGrayColor,),
                          const Icon(Icons.favorite,color: AppColors.kPrimaryGrayColor),
                        ],
                      )),

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0 , right: 20.0),
                    child: Divider(color: AppColors.kPrimaryGrayColor.withOpacity(0.8),thickness: 0.5,),
                  ),

                  Container(
                      padding: const EdgeInsets.only(left: 30.0, top: 20.0 , bottom: 25.0 , right: 30),
                      alignment: (activeLanguage == "en" ? Alignment.bottomLeft : Alignment.bottomRight),
                      child:  Text(
                        S.of(context).packaging_review,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.bodyText1?.color),
                      )),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 30.0,
                    itemPadding:const EdgeInsets.only( bottom: 20.0),
                    itemBuilder: (context, _) =>const Icon(
                      Icons.star,
                      color: AppColors.kPrimaryRedColor,
                    ),
                    onRatingUpdate: (rating) {
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0 , right: 20.0),
                    child: Divider(color: AppColors.kPrimaryGrayColor.withOpacity(0.8),thickness: 0.5,),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 30.0, top: 20.0 , bottom: 25.0 , right: 30),
                      alignment: (activeLanguage == "en" ? Alignment.bottomLeft : Alignment.bottomRight),
                      child:  Text(
                        S.of(context).delivery_rating,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.bodyText1?.color),
                      )),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 30.0,
                    itemPadding:const EdgeInsets.only( bottom: 20.0),
                    itemBuilder: (context, _) =>const Icon(
                      Icons.star,
                      color: AppColors.kPrimaryRedColor,
                    ),
                    onRatingUpdate: (rating) {
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0 , right: 20.0),
                    child: Divider(color: AppColors.kPrimaryGrayColor.withOpacity(0.8),thickness: 0.5,),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 30.0, top: 20.0 , bottom: 25.0 , right: 30),
                      alignment: (activeLanguage == "en" ? Alignment.bottomLeft : Alignment.bottomRight),
                      child:  Text(
                        S.of(context).comment,
                        style:  TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.bodyText1?.color),
                      )),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width *0.7,
                    child: TextFormField(
                      style: const TextStyle(color: AppColors.kPrimaryGreenColor),

                      cursorColor: AppColors.kPrimaryRedColor,

                      textAlign: TextAlign.left,
                      controller: controller,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            top: 5, bottom: 5, right: 10, left: 10.0),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color:  AppColors.kPrimaryGrayColor, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: AppColors.kPrimaryGrayColor,
                              width: 1.0),
                        ),
                        //labelText: widget.text,
                        labelStyle: const TextStyle(
                            color :Colors.white60,
                            fontSize: 15.0),

                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  CustomButton(text: S.of(context).add,width: 75.0 ,height: 30.0,onTap: (){},),
                  const SizedBox(height: 20.0,),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
