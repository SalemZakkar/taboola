import 'package:flutter/material.dart';
import 'package:taboola/abstracts/states/state.dart';
import 'package:taboola/module_customer/customers_routes.dart';
import 'package:taboola/module_customer/model/customers_model.dart';
import 'package:taboola/module_customer/ui/screen/customers_screen.dart';
import 'package:taboola/module_theme/service/theme_service/theme_service.dart';
import 'package:taboola/utils/components/background_screen.dart';
import 'package:taboola/utils/components/progresive_image.dart';
import 'package:taboola/utils/images/images.dart';

class CustomersLoadedState extends States {
  CustomersScreenState screenState;
  List<CustomersModel> customers;
  int _selectedItemPosition = 0;
  TextEditingController search = TextEditingController();
  CustomersLoadedState(this.screenState, {required this.customers})
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          color: Theme.of(context).backgroundColor,
        ),
        Image.asset(
          ImageAsset.BACKGROUND_IMAGE,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fill,
        ),
        GestureDetector(
          onTap: () {
            var focus = FocusScope.of(context);
            if (!focus.hasPrimaryFocus) {
              focus.unfocus();
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title: Image.asset(ImageAsset.LOGO , width: 100,),
            ),
            body: getCustomers(context),
          ),
        )
      ],
    );
  }

  Widget getCustomers(BuildContext context) {
    List<Widget> widgets = [];
    customers.forEach((element) {
      widgets.add(Padding(
        padding: const EdgeInsets.all(5),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
                CustomersRoutes.CUSTOMER_DETAILS_SCREEN,
                arguments: element.customerId);
          },
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    width: 60.0,
                    height: 60.0,
                   // margin: const EdgeInsets.only(right: 15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(71),
                      child: CustomNetworkImage(
                        imageSource: element.profileImage ?? '',
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${element.user.username}',
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold , color: Theme.of(context).textTheme.bodyText1?.color),
                      ),
                      Text(
                        '${element.user.email}',
                        style: TextStyle(fontSize: 15.0 , color: AppColors.kPrimaryGrayColor),
                      )
                    ],
                  ),
                  Spacer(),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {},
                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      margin: const EdgeInsets.only(right: 10.0),
                      child: const Center(
                          child: Icon(
                        Icons.chat_bubble,
                        size: 20.0,
                      )),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      width: 30.0,
                      height: 30.0,
                      margin: const EdgeInsets.only(right: 10.0),
                      child: const Center(
                          child: Icon(
                        Icons.delete,
                        size: 20.0,
                      )),
                    ),
                  )
                ],
              ),
              Divider(
                color: Theme.of(context).disabledColor.withOpacity(0.8),
                thickness: 0.5,
              )
            ],
          ),
        ),
      ));
    });
    return Column(children: widgets);
  }
}
