import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/main_sdk/models/common/result_class.dart';
import 'package:taboola_user/main_sdk/models/item_filter_parameter.dart';
import 'package:taboola_user/main_sdk/models/meal_category_model.dart';
import 'package:taboola_user/managment/main_apis_services.dart';
import 'package:taboola_user/routes.dart';
import 'package:taboola_user/ui/pages/filter_page/filter_page.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_future_builder.dart';


import 'search_result_widget/search_result_widget.dart';
class SearchResultPage extends StatefulWidget {
  final Search search;
  const SearchResultPage({Key? key ,required this.search}) : super(key: key);
  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  ItemsFilterParameters itemsFilterParameters = ItemsFilterParameters();
  Future<ResponseState<ListOfMealByCategoryAndSearch>>? getSearch;

  Key key = UniqueKey();

  List<RadioModelRate> radioModelRate=[];
  List<RadioModelTags> radioModelTags=[];
  @override
  void initState() {
   // itemsFilterParameters.mealName = widget.textSearch;
    getSearch = ApiConfigModel.futureSearch( itemsFilterParameters: itemsFilterParameters.copyWith(mealName:widget.search.text ) , refresh: true ,);
    itemsFilterParameters.mealName = widget.search.text;
    radioModelRate.add(RadioModelRate(id: 1 , text: "1+ stars" , isSelected: false , rate: 1.0));
    radioModelRate.add(RadioModelRate(id: 1 , text: "2+ stars" , isSelected: false , rate: 2.0));
    radioModelRate.add(RadioModelRate(id: 1 , text: "3+ stars" , isSelected: false , rate: 3.0));
    radioModelRate.add(RadioModelRate(id: 1 , text: "4+ stars" , isSelected: false , rate: 4.0));
    radioModelRate.add(RadioModelRate(id: 1 , text: "5 stars" , isSelected: false , rate: 5.0));

    for(var tag in widget.search.data!){
      radioModelTags.add(RadioModelTags(id: tag.category!.categoryId , isSelected: false , text:tag.category?.categoryName??"" ));
    }

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          color: Theme.of(context).backgroundColor,
        ),
        Image.asset(Assets.backgroundImage , width: size.width, height: size.height, fit: BoxFit.fill,),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            //elevation: 0,
            //backgroundColor: Colors.transparent,
            title: const Text("SearchResult"),
            actions: [
              IconButton(onPressed: (){
                Navigator.pushNamed(context, Routes.filter , arguments: Filter(radioModelTags: radioModelTags,itemsFilterParametersNew: itemsFilterParameters, radioModelRate: radioModelRate , itemsFilterParameters: (item){
                  setState(() {
                    item.copyWith(mealName : widget.search.text);
                    itemsFilterParameters = item;
                    key = UniqueKey();
                    getSearch = ApiConfigModel.futureSearch(itemsFilterParameters: itemsFilterParameters , refresh: true);
                  });
                }));
              }, icon: Icon(Icons.filter_alt_rounded , color: AppColors.kPrimaryGreenColor,))
            ],
          ),
          body: Container(
            color: Colors.transparent,
            alignment: Alignment.topCenter,
            constraints: const BoxConstraints.expand(),
         //   padding: const EdgeInsets.only(left: 20 , right: 20),
            child:AppFutureBuilder<ListOfMealByCategoryAndSearch>(
              future: getSearch!,
              retry:()=> getSearch!,
              key: key,
              whenDone: (data){
                return SingleChildScrollView(
                  child: ListView.builder(
                    itemCount: data.data?.length,
                    padding: const EdgeInsets.all(10),
                    shrinkWrap: true,
                    itemBuilder: (_,index){
                      return  InkWell(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onTap: (){
                            Navigator.pushNamed(context, Routes.productDetails , arguments:data.data![index].meal!.mealId );
                          },
                          child: SearchResultWidget(mealCategory: data.data![index].meal!,));
                    },
                    physics: const BouncingScrollPhysics(),
                  ),
                );
              },
            )

           // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Expanded(
            //       child: ListView.builder(
            //         physics: const BouncingScrollPhysics(),
            //         itemCount: 20,
            //         itemBuilder: (_,i){
            //           return Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: const [
            //               SizedBox(
            //                 height: 30,
            //               )
            //             ],
            //           );
            //         },
            //       ),
            //     )
            //   ],
            // ),
          ),
        )
      ],
    );
  }
}

