import 'package:flutter/material.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main_sdk/models/home_models/rating_model.dart';
import 'package:taboola_user/ui/pages/details_product_page/details_product_widget/rating_holder.dart';
import 'package:timeago/timeago.dart' as time_ago;
import '../../../main.dart';
class AllReviewPage extends StatefulWidget {
  final List<Ratings>? ratings;
  const AllReviewPage({Key? key , this.ratings}) : super(key: key);
  @override
  _AllReviewPageState createState() => _AllReviewPageState();
}

class _AllReviewPageState extends State<AllReviewPage> {
  String getTimeAge(DateTime loadedTime) {
    time_ago.setLocaleMessages(activeLanguage, (activeLanguage == "en" ? time_ago.EnMessages() : time_ago.ArMessages()));
    return time_ago.format(loadedTime, locale: activeLanguage, allowFromNow: true);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height,
          color: Theme.of(context).backgroundColor,
        ),
        Image.asset(Assets.backgroundImage , width: size.width, height: size.height,fit: BoxFit.fill,),
        Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).reviews_from_c),
          ),
          body: ListView.builder(
              itemCount: widget.ratings?.length,
              physics: const BouncingScrollPhysics(),
              //shrinkWrap: true,
              padding: const EdgeInsets.all(5),
              itemBuilder: (context , index){
                DateTime? tempDate = DateTime.parse(widget.ratings![index].createdAt??"");
            return RatingCard(ratings: widget.ratings?[index] ?? Ratings());
          }),
        )
      ],

    );
  }
}
