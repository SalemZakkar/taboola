import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/main_sdk/models/item_filter_parameter.dart';
import 'package:taboola_user/routes.dart';
import 'package:taboola_user/ui/shared/widget/custom_button.dart';

class FilterPage extends StatefulWidget {
  final Filter filter;
  const FilterPage({Key? key , required this.filter}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  RangeLabels labels = const RangeLabels('100', "200000");
  RangeValues values = const RangeValues(100, 200000);
  ItemsFilterParameters itemsFilterParameters = ItemsFilterParameters();
  
  @override
  void initState() {
    itemsFilterParameters = widget.filter.itemsFilterParametersNew!;
    if(widget.filter.itemsFilterParametersNew?.categoryId!=null){
      widget.filter.radioModelTags.firstWhere((element) => element.id==widget.filter.itemsFilterParametersNew!.categoryId).isSelected = true;
    }
    if(widget.filter.itemsFilterParametersNew?.mealRating!=null){
      widget.filter.radioModelRate.firstWhere((element) => element.rate==widget.filter.itemsFilterParametersNew!.mealRating).isSelected = true;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).backgroundColor
        ),
        Image.asset(
          Assets.backgroundImage,
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text("Filter"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 15.0, right: 15.0),
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "FILTER BY Tags",
                          style: TextStyle(fontSize: 12.0),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          spacing: 10, // gap between adjacent chips
                          runSpacing: 10, //

                          children: widget.filter.radioModelTags
                              .map((item) =>InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  widget.filter.radioModelTags
                                      .forEach((element) => element.isSelected = false);
                                  int indexTag = widget.filter.radioModelTags.indexWhere((element) => element==item);
                                  widget.filter.radioModelTags[indexTag].isSelected = true;
                                  itemsFilterParameters.categoryId = item.id;
                                });
                              },
                              child: ChoiceItemTags(item: item,)))
                              .toList(),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          "FILTER BY RATING",
                          style: TextStyle(fontSize: 12.0),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 10, right: 10),
                          height: 150,
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              crossAxisCount: 2,
                              childAspectRatio: 3.5,
                            ),
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: widget.filter.radioModelRate.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    widget.filter.radioModelRate
                                        .forEach((element) => element.isSelected = false);
                                    widget.filter.radioModelRate[index].isSelected = true;
                                    itemsFilterParameters.mealRating= widget.filter.radioModelRate[index].rate;
                                  });
                                },
                                child: ChoiceItemRate(
                                  item: widget.filter.radioModelRate[index],
                                ),
                              );
                            },
                          ),
                        ),


                      ],
                    )),
                Container(
                    padding: const EdgeInsets.only(top: 10.0, left: 15.0),
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      "FILTER BY PRICE RANGE",
                      style: TextStyle(fontSize: 12.0),
                    )),
                RangeSlider(
                    divisions: 10,
                    activeColor: AppColors.kPrimaryGreenColor,
                    inactiveColor: AppColors.kPrimaryGreenColor,
                    min: 100,
                    max: 200000,
                    values: values,
                    labels: labels,
                    onChanged: (value) {
                      print("START: ${value.start}, End: ${value.end}");
                      setState(() {
                        values = value;
                        labels = RangeLabels(
                            "${value.start.toInt().toString()}\$",
                            "${value.end.toInt().toString()}\$");
                        itemsFilterParameters.minPrice= value.start.toDouble();
                        itemsFilterParameters.maxPrice= value.end.toDouble();
                      });
                    }),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomButton(text: "filter",color: AppColors.kPrimaryGreenColor,width: 100.0,height: 40.0,
                        onTap: (){
                        if(widget.filter.itemsFilterParameters!=null){
                          itemsFilterParameters.mealName = widget.filter.itemsFilterParametersNew?.mealName??"";
                          widget.filter.itemsFilterParameters!(itemsFilterParameters);
                        }
                        Navigator.pop(context , true);
                        },
                      ),
                      CustomButton(text: "clear",color: AppColors.kPrimaryGrayColor,width: 100.0,height: 40.0,
                        onTap: (){
                        if(widget.filter.itemsFilterParameters!=null){
                          widget.filter.radioModelTags
                              .forEach((element) => element.isSelected = false);
                          widget.filter.radioModelRate
                              .forEach((element) => element.isSelected = false);
                          widget.filter.itemsFilterParameters!(ItemsFilterParameters(mealName: widget.filter.itemsFilterParametersNew?.mealName??""));
                        }
                        Navigator.pop(context , true);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Star extends StatelessWidget {
 final Color color;
  final String? text;
  final double? numberOfStar;
  const Star({Key? key,this.color =AppColors.kPrimaryGrayColor , this.text, this.numberOfStar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 35,
      padding: const EdgeInsets.only(left: 5.0),
      decoration: BoxDecoration(
        color: AppColors.kPrimaryBodyColor,
        border: Border.all(color: color , width: 2.0),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: [
          RatingBarIndicator(
            unratedColor: AppColors.kPrimaryGrayColor,
            rating: numberOfStar ?? 0.0,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: AppColors.kPrimaryRedColor,
            ),
            itemCount: 5,
            itemSize: 15.0,
            direction: Axis.horizontal,
          ),
          SizedBox(
            width: 3.0,
          ),
          Text(
            text ?? "",
            style: const TextStyle(
                color: AppColors.kPrimaryGreenBlackColor1, fontSize: 14.0),
          )
        ],
      ),
    );
  }
}

class Tags extends StatelessWidget {
  final Color colors;
  final String? text;
  const Tags({Key? key, this.colors = AppColors.kPrimaryGrayColor, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
          height: 35,
          padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 8),
          decoration: BoxDecoration(
            color: AppColors.kPrimaryBodyColor,
            border: Border.all(color: colors , width: 2.0),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Text(
            text ?? "",
            style: const TextStyle(
                color: AppColors.kPrimaryGreenBlackColor1, fontSize: 14.0),
          )),
    );
  }
}

class RadioModelTags {
  final String? id;
  bool isSelected;
  final String? text;

  RadioModelTags(
      {required this.id,
        this.isSelected = false,
        this.text});
}

class ChoiceItemTags extends StatelessWidget {
  final RadioModelTags item;
  const ChoiceItemTags({Key? key ,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tags(text: item.text ,colors: item.isSelected?AppColors.kPrimaryGreenColor: AppColors.kPrimaryGrayColor,);
  }
}


class RadioModelRate {
  final int? id;
  bool isSelected;
  final String? text;
  final num? rate;

  RadioModelRate(
      {required this.id,
        this.isSelected = false,
        this.text,
        this.rate});
}

class ChoiceItemRate extends StatelessWidget {
  final RadioModelRate item;
  const ChoiceItemRate({Key? key ,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Star(text: item.text,numberOfStar:item.rate!.toDouble() ,color: item.isSelected?AppColors.kPrimaryGreenColor: AppColors.kPrimaryGrayColor,);
  }
}