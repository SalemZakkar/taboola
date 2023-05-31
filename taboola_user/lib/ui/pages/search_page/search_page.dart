import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/local_storage/helper_search.dart';
import 'package:taboola_user/local_storage/search_model_local.dart';
import 'package:taboola_user/main_sdk/models/home_models/category_model.dart';
import 'package:taboola_user/managment/main_apis_services.dart';
import 'package:taboola_user/managment/main_provider.dart';
import 'package:taboola_user/routes.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_future_builder.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ScrollController controller = ScrollController();
  TextEditingController searchText = TextEditingController();
  var key = UniqueKey();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
              color: Theme.of(context).backgroundColor),
          Image.asset(
            Assets.backgroundImage,
            width: size.width,
            height: size.height,
            fit: BoxFit.fill,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Image.asset(
                Assets.logoImage,
                width: 120,
              ),
              centerTitle: true,
            ),
            body: AppFutureBuilder<ListOfCategory>(
            future: ApiConfigModel.futureAllMenu(),
            retry: () => ApiConfigModel.futureAllMenu(refresh: true),
            whenDone: (data) {return Container(
      color: Colors.transparent,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(left: 20, right: 20),
      constraints: const BoxConstraints.expand(),
      child: Selector<DataBaseProvider, SearchModelFood>(
          selector: (context, dataBaseProvider) =>
              dataBaseProvider.getSearchItems(),
          builder: (_, numberOfCartItems, child) {
            return numberOfCartItems.length > 0
                ? Column(
              children: [
                components(context, size),
                ListView.builder(
                  controller: controller,
                  itemCount: numberOfCartItems.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.searchResult,
                            arguments:Search(text: numberOfCartItems
                                .items[index].searchText , data: data.data) );
                      },
                      child: listOfResultSearch(
                          context,
                          size,
                          numberOfCartItems.items[index].searchText,
                          index),
                    );
                  },
                ),
              ],
            )
                : components(context, size);
          }),
    );}
            )
            ,
          )
        ],
      ),
    );
  }

  Widget components(BuildContext context, Size size) {
    return Column(
      children: [
        Container(
          width: size.width,
          height: 100,
          color: Colors.transparent,
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
                suffix: IconButton(
                  onPressed: () {
                    if (searchText.text.isNotEmpty) {
                      if (searchText.text.length > 0) {
                        SearchModelFood search =
                            DatabaseHelperSearch().getSearchHelper();
                        int index = search.items.indexWhere(
                            (element) => element.searchText == searchText.text);
                        if (index == -1) {
                          Provider.of<DataBaseProvider>(context, listen: false)
                              .addItemSearch(
                            ItemSearch(
                              searchText: searchText.text,
                            ),
                          );
                        }
                        Navigator.pushNamed(context, Routes.searchResult,
                            arguments: searchText.text);
                      }
                    }
                  },
                  icon: const Icon(
                    Icons.search,
                    color: AppColors.kPrimaryGreenColor,
                  ),
                ),
                hintText: S.of(context).search,
                hintStyle: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1?.color)),
            controller: searchText,
            onSubmitted: (string) {
              if (searchText.text.isNotEmpty) {
                if (searchText.text.length > 0) {
                  SearchModelFood search =
                      DatabaseHelperSearch().getSearchHelper();
                  int index = search.items.indexWhere(
                      (element) => element.searchText == searchText.text);
                  if (index == -1) {
                    Provider.of<DataBaseProvider>(context, listen: false)
                        .addItemSearch(
                      ItemSearch(
                        searchText: searchText.text,
                      ),
                    );
                  }
                  Navigator.pushNamed(context, Routes.searchResult,
                      arguments: searchText.text);
                }
              }
            },
          ),
        ),
         Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             Text(
               S.of(context).recent,
               style: TextStyle(color: Theme.of(context).primaryColor),
             ),
           ],
         )
      ],
    );
  }

  Widget listOfResultSearch(
      BuildContext context, Size size, String history, int index) {
    return Column(
      children: [
        SizedBox(
          width: size.width,
          height: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                child: SizedBox(
                  width: size.width * 0.7,
                  child: Text(
                    history,
                    textScaleFactor: 0.8,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText2?.color),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      Provider.of<DataBaseProvider>(context, listen: false)
                          .removeItemSearchByIndex(index);
                    });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: AppColors.kPrimaryRedColor,
                  ))
            ],
          ),
        ),
        Container(
          width: size.width,
          height: 1,
          color: AppColors.kPrimaryLightColor,
        )
      ],
    );
  }
}
