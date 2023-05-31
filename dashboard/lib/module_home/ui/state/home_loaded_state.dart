import 'package:flutter/material.dart';
import 'package:taboola/module_home/model/categories_model.dart';
import 'package:taboola/module_home/ui/screen/home_screen.dart';
import 'package:taboola/module_home/ui/state/home_state.dart';
import 'package:taboola/module_theme/pressistance/theme_preferences_helper.dart';
import 'package:taboola/module_theme/service/theme_service/theme_service.dart';
import 'package:taboola/utils/components/progresive_image.dart';
import 'package:taboola/utils/images/images.dart';
class HomeLoadedState extends HomeState {
  HomeScreenState screenState;
  List<CategoriesModel> categories;
  int _selectedItemPosition = 0;
  TextEditingController search = TextEditingController();
  HomeLoadedState(this.screenState,
      {required this.categories})
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          color: Theme.of(context).backgroundColor,
        ),
        Image.asset(ImageAsset.BACKGROUND_IMAGE , width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,fit: BoxFit.fill,),
        Scaffold(
          //backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            //backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Image.asset(
              ImageAsset.LOGO,
              height: 60,
              width: 120,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child:  Icon(Icons.add , color: Theme.of(context).backgroundColor,),
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {

            },

          ),
          body: SingleChildScrollView(
            child: getCategories(context),
          ),
        )
      ],
    );
  }

  Widget getCategories(BuildContext context) {
    print(categories.length);
    List<Widget> widgets = [];
    categories.forEach((element) {
      widgets.add(InkWell(
        onTap: (){

        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 120.0,
                height: 90.0,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(25),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Theme.of(context).disabledColor.withOpacity(0.25),
                  //     spreadRadius: 1.0,
                  //     blurRadius: 1.0,
                  //     offset: const Offset(0, 4),
                  //   ),
                  // ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CustomNetworkImage(
                    imageSource: element.categoryImage,
                    width: 120.0,
                    height: 90.0,
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.05,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("category" , style: TextStyle(fontSize: 14.0 , fontWeight: FontWeight.bold , overflow: TextOverflow.clip , color: Theme.of(context).textTheme.bodyText1?.color),textAlign: TextAlign.center,),
                  const Text("\n" , textScaleFactor: 0.3,),
                  Text("100 items" , style: TextStyle(fontSize: 12.0 , overflow: TextOverflow.clip , color: Theme.of(context).textTheme.bodyText1?.color),textAlign: TextAlign.center,),

                ],
              ),
              Expanded(child: SizedBox()),
              InkWell(
                splashColor: AppColors.overLay,
                highlightColor: Colors.transparent,
                onTap: (){
                  ThemePreferencesHelper().setDayMode();
                  screenState.refresh();
                },
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(Icons.delete ,size: 20.0,color: Colors.red,)),
              ),
            ],
          ),
        ),
      ));
    });
  return Flex(direction: Axis.vertical,children: widgets,);
  }
}
