import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main_sdk/models/cart_model.dart';
import 'package:taboola_user/main_sdk/models/home_models/meal_model.dart';
import 'package:taboola_user/main_sdk/servisec/identity/cart_identity_apis.dart';
class CartCard extends StatefulWidget {
  final CartResult cartResult;
  Function setS;
  CartCard({Key? key , required this.cartResult , required this.setS}) : super(key: key);

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  var sub;
  var q;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    q = (widget.cartResult.cartItem?.quantity ?? 0);
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        width: size.width,
        height: 120,
        child: Slidable(
          actionPane: const SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,

          child: Padding(
            padding: EdgeInsets.only(left: 40),
            child: Container(
              height: 120,
              width: size.width,
              decoration: BoxDecoration(
                color: AppColors.kPrimaryLightColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25) , bottomLeft: Radius.circular(25))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width*0.02,
                  ),
                  CircleAvatar(
                    maxRadius: 50,
                    backgroundColor: Theme.of(context).backgroundColor,
                  ),
                  SizedBox(
                    width: size.width*0.02,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.cartResult.cartItem?.meal?.mealName ?? "null" , textScaleFactor: 1,),
                      Text(widget.cartResult.cartItem?.meal?.customerMealPrice.toString() ?? "null" , textScaleFactor: 1,),
                      Row(
                        children: [
                          InkWell(
                            child: Icon(Icons.add_circle_outline),
                            onTap: ()  {
                              CartIdentityApi().increaseAmountOfCart(widget.cartResult.cartItem?.meal ?? Meal());
                              setState(() {
                                q++;
                              });

                            },
                          ),
                          Text(q.toString()  , textScaleFactor: 1,),
                          InkWell(
                            child: Icon(Icons.remove_circle_outline),
                            onTap: ()  {
                              if(q>1){
                                CartIdentityApi().removeAmountOfCart(widget.cartResult.cartItem?.meal ?? Meal());
                                setState(() {
                                  q--;
                                });
                              }
                            },
                          )
                        ],
                      )

                    ],
                  ),
                  SizedBox(
                    width: size.width*0.02,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          width: size.width*0.2,
                          
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(50)
                          ),
                          height: 50,
                          child: Text(S.of(context).orderNow , style: TextStyle(color: AppColors.kPrimaryBodyColor),),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          secondaryActions: [
            IconSlideAction(
              icon: Icons.delete,
              color: AppColors.kPrimaryRedColor,

            ),
            IconSlideAction(
              icon: Icons.favorite,
              color: AppColors.kPrimaryYellowColor,
            )
          ],
        ),
      ),
    );
  }
}
