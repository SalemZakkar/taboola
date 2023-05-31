import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main_sdk/models/cart_model.dart';
import 'package:taboola_user/main_sdk/models/home_models/meal_model.dart';
import 'package:taboola_user/main_sdk/models/wish_model.dart';
import 'package:taboola_user/main_sdk/servisec/identity/cart_identity_apis.dart';
import 'package:taboola_user/main_sdk/servisec/identity/wish_idetity_service.dart';
import 'package:taboola_user/routes.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_token_future_builder.dart';
import 'package:taboola_user/ui/shared/widget/custom_button.dart';
class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double subTotal = 0.0;
  double deliveryCost = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).backgroundColor,
        ),
        Image.asset(Assets.backgroundImage , width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,fit: BoxFit.fill,),
        Scaffold(
          //backgroundColor: AppColors.kPrimaryBodyColor,
          appBar: AppBar(
            title: Text(S.of(context).shopping_cart),
          ),
          body: AppTokenFutureBuilder(
            child: AppFutureBuilder<ListOfCart>(
              future:CartIdentityApi().getCart() ,
              retry:()=>CartIdentityApi().getCart() ,
              whenDone: (data){
                if(data.data?.isNotEmpty??false){
                  if(subTotal==0.0){
                    for (var element in data.data!) {

                      subTotal =subTotal+  ((double.tryParse(element.cartItem!.meal?.customerMealPrice.toString()??"0.0")!) * element.cartItem!.quantity!)  ;
                    }
                  }
                }
                if(data.data?.isNotEmpty??false){
                  return Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children:  [
                            ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                // return cartItem(context, data.data![index].cartItem!);

                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  color: AppColors.kPrimaryGreenBlackColor1,
                                  padding:const  EdgeInsets.only(top: 10.0 , bottom: 10.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width*0.8,
                                    height: 100.0,
                                    child:Slidable(
                                      actionPane: const SlidableDrawerActionPane(),
                                      actionExtentRatio: 0.25,
                                      child: Container(
                                          margin: const EdgeInsets.only(left: 25.0),
                                          height: 100.0,
                                          padding:const EdgeInsets.only(left: 10.0 , right: 20.0),
                                          decoration: const BoxDecoration(
                                              color: AppColors.kPrimaryLightColor,
                                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25.0) , topLeft: Radius.circular(25.0))
                                          ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 80.0,
                                                    height: 80.0,
                                                    margin:const EdgeInsets.only(right: 10.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(35),
                                                    ),
                                                    child:ClipRRect(
                                                      borderRadius: BorderRadius.circular(35.0),
                                                      child:data.data![index].cartItem!.meal?.mealMainImage!=null? CachedNetworkImage(
                                                        placeholder: (context, url) =>const Center(child: SizedBox(width: 25.0 ,height: 25.0,child: CircularProgressIndicator(color: AppColors.kPrimaryGreenColor,))),
                                                        imageUrl:data.data![index].cartItem!.meal!.mealMainImage!,
                                                        fit: BoxFit.cover,
                                                        width: 80,
                                                        height: 80,
                                                        errorWidget: (context, url, error) =>
                                                        const Icon(Icons.error),
                                                      ): Image.asset(
                                                        Assets.defaultImage,
                                                        width: 80.0,
                                                        height: 80.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      SizedBox(
                                                          height: 18.0,
                                                          width: MediaQuery.of(context).size.width*0.3,
                                                          child: Text(data.data![index].cartItem!.meal?.mealName??"" , style: const TextStyle(fontSize: 14.0 ,fontWeight: FontWeight.bold ,fontStyle: FontStyle.italic,color: AppColors.kPrimaryGreenBlackColor1  ),overflow: TextOverflow.ellipsis,)),
                                                      SizedBox(
                                                          height: 25.0,
                                                          width: MediaQuery.of(context).size.width*0.3,
                                                          child: Text(data.data![index].cartItem!.meal?.mealDescription??"" , style:const TextStyle(fontSize: 10.0 ,fontWeight: FontWeight.bold ,fontStyle: FontStyle.italic,color: AppColors.kPrimaryGrayColor  ),)),
                                                      SizedBox(height: 25.0,
                                                          width: MediaQuery.of(context).size.width*0.3,
                                                          child: Text(data.data![index].cartItem!.meal?.customerMealPrice.toString()??"" , style:const TextStyle(fontSize: 10.0 ,fontWeight: FontWeight.bold ,fontStyle: FontStyle.italic,color: AppColors.kPrimaryGrayColor  ),)),
                                                      Row(
                                                        children: [
                                                          InkWell(
                                                            child: const Icon(Icons.add_box_outlined , size: 25,color: AppColors.kPrimaryBlackColor,),
                                                            onTap: (){
                                                              setState(() {
                                                                CartIdentityApi().increaseAmountOfCart(Meal(mealId: data.data![index].cartItem!.meal?.mealId));
                                                                data.data![index].cartItem!.quantity =data.data![index].cartItem!.quantity! + 1 ;
                                                                subTotal =subTotal+  ((double.tryParse(data.data![index].cartItem!.meal?.customerMealPrice.toString()??"0.0")!))  ;
                                                              });


                                                            },

                                                          ),
                                                          Padding(
                                                            padding:const EdgeInsets.only(left: 10.0 , right: 10.0),
                                                            child: Text(data.data![index].cartItem!.quantity?.toString()??"" , style:const TextStyle(fontSize: 10.0 ,fontWeight: FontWeight.bold ,fontStyle: FontStyle.italic,color: AppColors.kPrimaryGrayColor  ),),
                                                          ),
                                                          InkWell(
                                                            child:  Icon(Icons.indeterminate_check_box_outlined , size: 25,color: data.data![index].cartItem!.quantity!=1? AppColors.kPrimaryBlackColor :AppColors.kPrimaryGrayColor ,),
                                                            onTap: (){
                                                              if(data.data![index].cartItem!.quantity!=1){
                                                                setState(() {
                                                                  CartIdentityApi().removeAmountOfCart(Meal(mealId: data.data![index].cartItem!.meal?.mealId));
                                                                  data.data![index].cartItem!.quantity =data.data![index].cartItem!.quantity! - 1 ;
                                                                  subTotal =subTotal-  ((double.tryParse(data.data![index].cartItem!.meal?.customerMealPrice.toString()??"0.0")!))  ;
                                                                });
                                                              }

                                                            },

                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),

                                              CustomButton(width:75.0,height: 25,color: AppColors.kPrimaryGreenColor,text: "Order Now",onTap: (){
                                                Navigator.pushNamed(context, Routes.myOrder , arguments:  CartSubmit(cartItem: data.data![index].cartItem , checkIfSingle: true));
                                              },)
                                            ],
                                          )
                                      ),

                                      secondaryActions: <Widget>[
                                        IconSlideAction(
                                          // caption: 'Delete',
                                          color: AppColors.kPrimaryRedColor,
                                          icon: Icons.delete,
                                          onTap: () {
                                            setState(() {
                                              CartIdentityApi().deleteFromCart(Meal(mealId: data.data![index].cartItem!.meal?.mealId));
                                              data.data!.removeAt(index);
                                            });

                                          },
                                        ),
                                        IconSlideAction(
                                          color: AppColors.kPrimaryGreenColor,
                                          icon: data.data![index].inWishlist!? Icons.favorite:Icons.favorite_border,
                                          onTap: () {
                                            if(data.data![index].inWishlist!){
                                              setState(() {
                                                data.data![index].inWishlist = false;
                                                WishListIdentityApi().deleteWish(WishModel(mealId:data.data![index].cartItem!.meal?.mealId ));
                                              });

                                            }else{
                                              setState(() {
                                                data.data![index].inWishlist = true;
                                                WishListIdentityApi().addWish(WishModel(mealId:data.data![index].cartItem!.meal?.mealId ));
                                              });
                                            }

                                          },
                                        ),

                                      ],
                                    ) ,
                                  ),
                                );
                              },
                              itemCount: data.data?.length,
                              physics: const BouncingScrollPhysics(),
                            ),
                            const SizedBox(height: 150.0,),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const  SizedBox(height: 10.0,),
                            DetailsCart(text: "Sub Total",price: subTotal.toString(),),
                            DetailsCart(text: "Delivery Cost",price:  deliveryCost.toString(),),
                            const  Padding(
                              padding:  EdgeInsets.only(left: 30.0 , right: 30.0),
                              child: Divider(color: AppColors.kPrimaryGrayColor,),
                            ),
                            DetailsCart(text: "Total",price: "${subTotal + deliveryCost}",),
                            const  SizedBox(height: 25.0,),
                            CustomButton(height: 45.0,color: AppColors.kPrimaryGreenColor,text: "CheckOut",width: 200.0,onTap: (){
                              Navigator.pushNamed(context, Routes.myOrder , arguments:  CartSubmit(checkIfSingle: false , cartResult: data.data));

                            },),
                            const  SizedBox(height: 15.0,),
                          ],
                        ),
                      )
                    ],
                  );
                }
                else{
                  return Center(
                    child: Text("cart is empty" , style:const TextStyle(fontWeight: FontWeight.bold , fontSize: 15.0 , color: AppColors.kPrimaryBlackColor),),
                  );
                }

              },
            )
            ,
          ),
        )
      ],
    );
  }

}
class DetailsCart extends StatelessWidget {
  final String? text;
  final String? price;
  const DetailsCart({Key? key , this.text , this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0 , right: 30.0 , bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(text??"" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 12.0 , color: Theme.of(context).textTheme.bodyText1?.color),),
          Text(price??"" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 12.0 , color: Theme.of(context).textTheme.bodyText1?.color),),
        ],
      ),
    );
  }
}