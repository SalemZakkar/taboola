import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main_sdk/models/home_models/category_model.dart';

class MenuCard extends StatefulWidget {
  final Categories results;
  final int mealsCount;
  const MenuCard({Key? key , required this.results , required this.mealsCount}) : super(key: key);

  @override
  _MenuCardState createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.9,
      height: 65,
      decoration:  BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(50)
      ),
      //padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(35),

                child: widget.results.categoryImage!=null?
                CachedNetworkImage(
                  placeholder: (context, url) =>const Center(child: SizedBox(width: 25.0 ,height: 25.0,child: CircularProgressIndicator(color: AppColors.kPrimaryGreenColor,))),
                  imageUrl:widget.results.categoryImage!,
                  fit: BoxFit.cover,
                  width: 65,
                  height: 65,
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                ):
                Image.asset(
                  Assets.defaultImage,
                  width: 65,
                  height:65,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: size.width*0.5,
                margin: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(widget.results.categoryName??"" , textScaleFactor: 0.77, style: TextStyle(color: AppColors.kPrimaryGreenColor),),
                    if(widget.mealsCount!=0)
                      const SizedBox(height: 5.0,),
                    if(widget.mealsCount!=0)
                      Text("${widget.mealsCount.toString()}" " ${S.of(context).items}" , textScaleFactor: 0.7, style: TextStyle(color: AppColors.kPrimaryGrayColor),)

                  ],
                ),
              ),
            ],
          ),

          const  Padding(
            padding: EdgeInsets.only(right: 10.0),
            child:  Icon(Icons.arrow_forward , color: AppColors.kPrimaryRedColor,),
          ),
        ],
      ),
    );
  }
}
