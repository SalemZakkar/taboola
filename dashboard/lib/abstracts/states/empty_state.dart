import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taboola/abstracts/states/state.dart';
import 'package:taboola/generated/l10n.dart';
import 'package:taboola/utils/components/custom_app_bar.dart';
import 'package:taboola/utils/images/images.dart';


class EmptyState extends States {
  State<StatefulWidget> screenState;
  final String emptyMessage;
  final String title;
  final int id;
  final bool hasAppbar;
  final VoidCallback onPressed;
  EmptyState(this.screenState,{required this.emptyMessage,required this.id ,required this.title,this.hasAppbar = true,required this.onPressed})
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Scaffold(
      appBar:hasAppbar ? CustomTwaslnaAppBar.appBar(context, title: title) : null,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Container(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(
                  emptyMessage,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),
            ),
            SvgPicture.asset(
              SvgAsset.EMPTY_SVG,
              height: MediaQuery.of(context).size.height * 0.5,
            ),
            Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 0),
                    onPressed:onPressed ,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        S.of(context).refresh,
                        style: TextStyle(color: Colors.white),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
